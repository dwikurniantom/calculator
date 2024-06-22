import 'package:intl/intl.dart';

extension StringCalculationExtension on String? {
  /// Convert numerical string to thousandFormat
  String get thousandFormat {
    /// Convert string to double with null handler
    final value = double.tryParse(this ?? '0') ?? 0.0;

    /// Thousand with decimal format, using en_us locale approach. the 15
    /// Decimal digits is refering to IEEE 754 standard that decimal handle up
    /// to 15 significant decimal digits
    final decimalFormat = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
    );

    /// Format the value with decimal formater
    return decimalFormat.format(value);
  }

  List<String>? get convertToOperators {
    final value = this;
    if (value != null) {
      return value.split(RegExp(r'[+\-×/]'));
    }
    return null;
  }

  List<String>? get convertToOperands {
    final value = this;
    if (value != null) {
      return value
          .split(RegExp(r'\d+\.\d+|\d+'))
          .where((String element) => element.isNotEmpty)
          .toList();
    }
    return null;
  }
}
