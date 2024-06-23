import 'package:smath/common/consts/data_format.dart';
import 'package:smath/common/extensions/double_calculator_extension.dart';
import 'package:smath/common/extensions/string_calculator_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calculator_state.dart';

/// Calculator state consist of 3 different input operation
/// 1. History input (value and operator)
/// 2. Temporary result
/// 3. Final result
class CalculatorCubit extends Cubit<CalculatorState?> {
  final TextEditingController inputController;
  final ScrollController inputScrollController;

  /// {@macro calculator_cubit}
  CalculatorCubit({
    required this.inputController,
    required this.inputScrollController,
  }) : super(null);

  /// Shorthand to retrieve text from TextEditingController
  String get currentText => inputController.text;

  bool get hasOperands => currentText.contains(
        DataFormat.operandRegexp,
      );

  /// Add number to the calculation proccess
  void add(int value) {
    /// Get elements by split string by operand
    final operators = currentText.convertToOperators;

    /// Get last section of input
    final lastSection = operators?.lastOrNull;

    /// If the previous value is 0 then the current value can't be 0
    if (lastSection == '0' && value == 0) return;

    /// Add number to textfield
    addNumber(value.toString());

    /// Auto calculate result if it already has operands
    if (hasOperands) {
      calculate();
    }
  }

  /// Remove last character from current text
  void remove() {
    /// Check if the current text is not empty
    if (currentText.isNotEmpty) {
      /// Get the text minus the last character
      final newText = currentText.substring(0, currentText.length - 1);

      /// Set it to TextEditingController
      inputController.text = newText;
    }
  }

  /// Clear all calculation proccess
  void clearAll() {
    inputController.clear();
    emit(null);
  }

  /// Divide last section with 100 (to get percentage)
  void percent() {
    /// Get operators (number) by split string by operand
    final operators = currentText.convertToOperators;

    /// Get last section of input
    final lastSection = operators?.lastOrNull;
    final lastCharacter = currentText[currentText.length - 1];
    final isOperand = DataFormat.operandRegexp.hasMatch(
      lastCharacter,
    );

    if (lastSection != null && !isOperand) {
      final value = double.tryParse(lastSection) ?? 0.0;

      final result = value / 100;

      final sanitizedResult = (result.hasZeroDecimal)
          ? result.toStringAsFixed(0)
          : result.toString();

      final sectionLength = lastSection.length;

      var text = currentText.substring(0, currentText.length - sectionLength);

      final textResult = '$text$sanitizedResult';

      inputController.text = textResult;

      /// Auto calculate result if it already has operands
      if (hasOperands) {
        calculate();
      }
    }
  }

  /// Substract previous variable and new variable
  void substract() {
    addOperand('-');
  }

  /// Add previous variable and new variable
  void addition() {
    addOperand('+');
  }

  /// Multiply previous variable and new variable
  void multiply() {
    addOperand('×');
  }

  /// Divide previous variable and new variable
  void divide() {
    addOperand('/');
  }

  /// Calculate the whole input, based on the current text input
  void calculate({
    bool isFinished = false,
  }) {
    /// Shorthand to retrieve text from TextEditingController
    final textInput = currentText;

    /// Shorthand to retrieve List of operands inside text input
    final operands = textInput.convertToOperands;

    /// Shorthand to retrieve List of operatos inside text input
    final operators = textInput.convertToOperators;

    if (operands != null && operators != null) {
      /// Change operator × to * this is becauser the math expression cannot
      /// use × unicode
      final sanitizedExpresion = currentText.replaceAll('×', '*');

      /// I use math parser for calculation proccess
      final mathParser = Parser();

      /// Then add the whole expresion to the mathParser
      final expressions = mathParser.parse(sanitizedExpresion);

      /// Context model for math evaluation
      final contextModel = ContextModel();

      /// Math evaluation invocation
      final mathEvaluation = expressions.evaluate(
        EvaluationType.REAL,
        contextModel,
      );

      /// Convert the evaluated result to string the parse it to double. This is
      /// because the mathEvaluation is dynamic by default
      final total = double.tryParse(mathEvaluation.toString()) ?? 0.0;

      /// Sanitize zero decimal to avoid useless decimal xx.0000
      final result = total.hasZeroDecimal ? total.toStringAsFixed(0) : total;

      /// If the calculate process is mean to finish all calculation it need
      /// to clear the result label and extract the result to textfield
      if (isFinished) {
        inputController.text = result.toString();
      }

      /// Update state
      emit(
        CalculatorState(
          /// Set result to state finalResult to change the final result label, if the
          /// isFinished is `false` it will set will the calculated result. Else
          /// will set to null
          finalResult: !isFinished ? result.toString() : null,

          /// isIdle is used for emphasis the final result label, and if the
          /// user did another calculation using the active result it will be
          /// set to false.
          isIdle: isFinished ? true : false,
        ),
      );
    }
  }

  /// Add comma if the last section is not decimal
  void comma() {
    /// Get elements by split string by operand
    final elements = currentText.convertToOperators;

    /// Get last section of input
    final lastSection = elements?.lastOrNull;

    /// Check if last section is decimal
    final isDecimal = lastSection?.contains('.') ?? false;

    /// Add comma if last section is not decimal and last section isnt null
    if (lastSection != null && !isDecimal) {
      addOperand('.');
    }
  }

  /// Base function to add operand to calculation runtime
  void addOperand(String operand) {
    /// Add operand to textfield
    if (currentText.isNotEmpty) {
      /// Check if last character is operand
      final lastCharacter = currentText[currentText.length - 1];
      final isOperand = DataFormat.operandRegexp.hasMatch(lastCharacter);

      if (isOperand) {
        /// If last character is operand then compare last character with input
        /// operand (cannot be the same)
        /// or any new operand input will replace the last operand
        if (lastCharacter != operand) {
          /// If last character is different than operand then remove lastchar
          final newText = currentText.substring(0, currentText.length - 1);

          /// And replace it with new operand
          inputController.text = '$newText$operand';
        }
      } else {
        /// Add operand rightaway
        inputController.text = '$currentText$operand';
      }

      /// Set idle to false
      emit(
        state?.copyWith(
          isIdle: false,
        ),
      );
    }
  }

  /// Base function to add number to calculation runtime
  void addNumber(String number) {
    if (currentText.isEmpty) {
      inputController.text = '$currentText$number';
    } else {
      /// Get elements by split string by operand
      final elements = currentText.convertToOperators;

      /// Get last section of input
      final lastSection = elements?.lastOrNull;

      /// get last input from current text by substring from last character -1
      final lastInput = currentText[currentText.length - 1];

      /// Check if last input is operand using RegExp
      final isLastInputOperand = DataFormat.operandRegexp.hasMatch(
        lastInput,
      );

      if (isLastInputOperand) {
        /// Check if last input is operand, if so add number to textfield
        inputController.text = '$currentText$number';
      } else if (lastSection != null) {
        /// Check if last section is null, if so add number to textfield
        /// Check if last section is decimal
        final isDecimal = lastSection.contains('.');

        /// Get first character from last section
        final firstCharacter = lastSection.isNotEmpty ? lastSection[0] : null;

        /// Check if first character is not 0 or it is decimal, otherwise it can
        /// be added to textfield
        if (firstCharacter != '0' || isDecimal) {
          /// Add number to textfield
          inputController.text = '$currentText$number';
        }
      } else {
        /// Add number to textfield
        inputController.text = '$currentText$number';
      }
    }
    emit(
      state?.copyWith(
        isIdle: false,
      ),
    );
  }
}
