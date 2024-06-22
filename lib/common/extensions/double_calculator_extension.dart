extension DoubleCalculationExtension on double {
  bool get hasZeroDecimal {
    return (this % 1 == 0);
  }
}
