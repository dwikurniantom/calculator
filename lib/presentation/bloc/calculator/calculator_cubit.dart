import 'package:calculator/common/extensions/double_calculator_extension.dart';
import 'package:calculator/common/extensions/string_calculator_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_state.dart';

/// Calculator state consist of 3 different input operation
/// 1. History input (value and operator)
/// 2. Temporary result
/// 3. Final result
class CalculatorCubit extends Cubit<CalculatorState?> {
  final TextEditingController inputController;

  /// {@macro calculator_cubit}
  CalculatorCubit(this.inputController) : super(null);

  /// Shorthand to retrieve text from TextEditingController
  String get currentText => inputController.text;

  /// Add number to the calculation proccess
  void add(int value) {
    /// Get elements by split string by operand
    final elements = inputController.text.split(
      RegExp(r'[+\-×/]'),
    );

    final hasOperands = inputController.text.contains(
      RegExp(r'[+\-×/]'),
    );

    /// Get last section of input
    final lastSection = elements.lastOrNull;

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

  /// Clear the current calculation proccess
  void clear() {
    inputController.clear();
  }

  /// Clear all calculation proccess
  void clearAll() {
    inputController.clear();
    emit(null);
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
    final textInput = inputController.text;

    /// Shorthand to retrieve List of operands inside text input
    final operands = textInput.convertToOperands;

    /// Shorthand to retrieve List of operatos inside text input
    final operators = textInput.convertToOperators;

    if (operands != null && operators != null) {
      /// Declare total variable, default value is operand 0
      double total = double.tryParse(operators.first) ?? 0.0;

      /// Run all the calculation command by looping the list of operation, then
      /// it will doing the mathematical calculation based on the operator
      for (int i = 0; i < operands.length; i++) {
        if (operands[i] == '+') {
          /// Additive operation (add new value to current total value)
          total += double.parse(operators[i + 1]);
        } else if (operands[i] == '-') {
          /// Substraction operation (Remove current total value with the new value)
          total -= double.parse(operators[i + 1]);
        } else if (operands[i] == '×') {
          /// Multiply operation (Multiplying current total value with the new value)
          total *= double.parse(operators[i + 1]);
        } else if (operands[i] == '/') {
          /// Divide operation (Dividing current total value with the new value)
          total /= double.parse(operators[i + 1]);
        }
      }

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
    final elements = inputController.text.split(
      RegExp(r'[+\-×/]'),
    );

    /// Get last section of input
    final lastSection = elements.lastOrNull;

    /// Check if last section is decimal
    final isDecimal = lastSection?.contains('.') ?? false;

    /// Add comma if last section is not decimal and last section isnt null
    if (lastSection != null && !isDecimal) {
      addOperand('.');
    }
  }

  /// Base function to add operand to calculation runtime
  void addOperand(String operand) {
    inputController.text = '$currentText$operand';
  }

  /// Base function to add number to calculation runtime
  void addNumber(String number) {
    inputController.text = '$currentText$number';
  }
}
