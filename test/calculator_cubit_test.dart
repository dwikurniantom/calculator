import 'package:calculator/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:calculator/presentation/bloc/calculator/calculator_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group(
    'CalculatorCubit',
    () {
      late CalculatorCubit calculatorCubit;
      late TextEditingController inputController;
      late ScrollController inputScrollController;

      setUp(() {
        inputController = TextEditingController();
        inputScrollController = ScrollController();
        calculatorCubit = CalculatorCubit(
          inputController: inputController,
          inputScrollController: inputScrollController,
        );
      });

      /// Teardown components after done testing
      tearDown(() {
        /// Close cubit
        calculatorCubit.close();

        /// Dispose TextEditingController
        inputController.dispose();

        /// Dispose scroll controller
        inputScrollController.dispose();
      });

      /// Run test (initial state when state is equal null)
      test('initial state is null', () {
        expect(
          calculatorCubit.state,
          equals(null),
        );
      });

      /// Run blocTest to test add number
      blocTest<CalculatorCubit, CalculatorState?>(
        'emits updated state when number is added',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add input 1, 2, 3, 4, 5, 6, 7, 8, 9, 0. This will mock user
          /// interaction on the keyboard to add the numbers
          cubit.add(1);
          cubit.add(2);
          cubit.add(3);
          cubit.add(4);
          cubit.add(5);
          cubit.add(6);
          cubit.add(7);
          cubit.add(8);
          cubit.add(9);
          cubit.add(0);
        },
        verify: (_) {
          /// Check the result to be match with the input
          expect(
            inputController.text,
            equals('1234567890'),
          );
        },
      );

      blocTest<CalculatorCubit, CalculatorState?>(
        'does not add zero if the first input is zero and not decimal',
        build: () => calculatorCubit,
        act: (cubit) {
          inputController.text = '0';
          cubit.add(0);
        },
        verify: (_) {
          /// The result should not be 00 (restricted)
          expect(
            inputController.text,
            isNot(
              equals('00'),
            ),
          );
        },
      );

      /// Test for remove function (backspace event)
      blocTest<CalculatorCubit, CalculatorState?>(
        'removes last character from current text',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add mock input 123
          inputController.text = '123';

          /// Execute remove action
          cubit.remove();
        },
        verify: (_) {
          /// The result should be 12
          expect(
            inputController.text,
            equals('12'),
          );
        },
      );

      /// Clear all calculation processed and emits null state
      blocTest<CalculatorCubit, CalculatorState?>(
        'clears all calculation processes and emits null state',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add mock input 123
          inputController.text = '123';

          /// Execute clear all event
          cubit.clearAll();
        },
        expect: () => [
          null,
        ],
        verify: (_) {
          /// Expect the result should be empty
          expect(
            inputController.text,
            equals(''),
          );
        },
      );

      /// Test addition event
      blocTest<CalculatorCubit, CalculatorState?>(
        'performs addition',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Write mock input manualy, it can be done using cubit.add(number)
          /// but in this case we can just straight pass the string to the
          /// textfield
          inputController.text = '2+3';

          ///  Calculate the result with isFinished
          cubit.calculate(
            isFinished: true,
          );
        },
        verify: (_) {
          /// The result shouldbe 5 (2+3) = 5
          expect(
            inputController.text,
            equals('5'),
          );
        },
      );

      /// Test substraction event
      blocTest<CalculatorCubit, CalculatorState?>(
        'performs subtraction',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Write mock input manualy, it can be done using cubit.add(number)
          /// but in this case we can just straight pass the string to the
          /// textfield
          inputController.text = '5-2';

          ///  Calculate the result with isFinished
          cubit.calculate(
            isFinished: true,
          );
        },
        verify: (_) {
          /// Expect the result should be 3 (5-2) = 3
          expect(
            inputController.text,
            equals('3'),
          );
        },
      );

      /// Test multiplication event
      blocTest<CalculatorCubit, CalculatorState?>(
        'performs multiplication',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Write mock input manualy, it can be done using cubit.add(number)
          /// but in this case we can just straight pass the string to the
          /// textfield
          inputController.text = '4×3';

          ///  Calculate the result with isFinished
          cubit.calculate(isFinished: true);
        },
        verify: (_) {
          /// Expect the result should be 12 (4×3) = 12
          expect(inputController.text, equals('12'));
        },
      );

      /// Test division event
      blocTest<CalculatorCubit, CalculatorState?>(
        'performs division',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Write mock input manualy, it can be done using cubit.add(number)
          /// but in this case we can just straight pass the string to the
          /// textfield
          inputController.text = '10/2';

          ///  Calculate the result with isFinished
          cubit.calculate(
            isFinished: true,
          );
        },
        verify: (_) {
          /// Expect the result should be 5 (10/2) = 5
          expect(
            inputController.text,
            equals('5'),
          );
        },
      );

      /// Test to add operand correctly (+)
      blocTest<CalculatorCubit, CalculatorState?>(
        'adds operand correctly (+)',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add number first to the textfield
          inputController.text = '1';

          /// Execute addition action
          cubit.addition();
        },
        verify: (_) {
          /// Expect the current text is 1+
          expect(
            inputController.text,
            equals('1+'),
          );
        },
      );

      /// Test to add operand correctly (-)
      blocTest<CalculatorCubit, CalculatorState?>(
        'adds operand correctly (-)',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add number first to the textfield
          inputController.text = '1';

          /// Execute subtraction action
          cubit.substract();
        },
        verify: (_) {
          /// Expect the current text is 1-
          expect(
            inputController.text,
            equals('1-'),
          );
        },
      );

      /// Test to add operand correctly (×)
      blocTest<CalculatorCubit, CalculatorState?>(
        'adds operand correctly (×)',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add number first to the textfield
          inputController.text = '1';

          /// Execute multiplication action
          cubit.multiply();
        },
        verify: (_) {
          /// Expect the current text is 1×
          expect(
            inputController.text,
            equals('1×'),
          );
        },
      );

      /// Test to add operand correctly (/)
      blocTest<CalculatorCubit, CalculatorState?>(
        'adds operand correctly (/)',
        build: () => calculatorCubit,
        act: (cubit) {
          /// Add number first to the textfield
          inputController.text = '1';

          /// Execute division action
          cubit.divide();
        },
        verify: (_) {
          /// Expect the current text is 1/
          expect(
            inputController.text,
            equals('1/'),
          );
        },
      );
    },
  );
}
