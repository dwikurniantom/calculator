import 'package:intl/intl.dart';

extension NumericIntNullableExtension on int? {
  String get thousandFormat {
    var value = this ?? 0;
    return NumberFormat('#,##0', 'id_ID').format(value);
  }
}
