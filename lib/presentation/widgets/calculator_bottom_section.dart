import 'package:flutter/material.dart';

import 'calculator_keyboard.dart';

class CalculatorBottomSection extends StatelessWidget {
  const CalculatorBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    /// Calculator keyboard, btw why the bottom section is having dedicated
    /// stateless class it's because in the future if we want to add history
    /// widgets, or any calculational operations. It can be done here
    return const CalculatorKeyboard();
  }
}
