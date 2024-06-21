import 'package:calculator/domain/entities/operand.dart';

class Operation {
  final String? valueA;
  final Operand? operand;
  final String? valueB;

  Operation({
    this.valueA,
    this.operand,
    this.valueB,
  });
}
