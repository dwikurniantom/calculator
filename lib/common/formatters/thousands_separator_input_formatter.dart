import 'package:calculator/common/extensions/string_calculator_extension.dart';
import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    List<String> elements = newValue.text.split(RegExp(r'[+\-*/]'));
    List<String> operators = newValue.text
        .split(RegExp(r'\d+\,\d+|\d+'))
        .where((String element) => element.isNotEmpty)
        .toList();
    final formattedElement =
        elements.map((element) => element.thousandFormat).toList();

    List<String> result = [];

    int maxLength = (formattedElement.length > operators.length)
        ? formattedElement.length
        : operators.length;

    for (int i = 0; i < maxLength; i++) {
      if (i < formattedElement.length) {
        result.add(formattedElement[i]);
      }
      if (i < operators.length) {
        result.add(operators[i]);
      }
    }

    return newValue;
  }
}
