import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<String?> {
  /// {@macro calculator_cubit}
  CalculatorCubit() : super('0');

  void add(int value) {
    /// Convert current number to string and add new value
    final newValue = (state != '0') ? '$state$value' : '$value';
    emit(newValue);
  }

  void clear() => emit('0');
}
