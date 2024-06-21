class CalculatorState {
  final bool isIdle;
  final String? finalResult;

  CalculatorState({
    this.isIdle = false,
    this.finalResult,
  });

  CalculatorState copyWith({
    bool? isIdle,
    String? finalResult,
  }) =>
      CalculatorState(
        finalResult: finalResult ?? this.finalResult,
        isIdle: isIdle ?? this.isIdle,
      );
}
