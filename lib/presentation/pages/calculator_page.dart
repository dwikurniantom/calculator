import 'package:smath/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:smath/presentation/bloc/calculator/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/calculator_bottom_section.dart';
import '../widgets/calculator_upper_section.dart';

class CalculatorPage extends StatefulWidget {
  /// Route name for CalculatorPage in app routes, to be used in [Navigator]
  /// ```dart
  /// Navigator.pushNamed(
  ///   context,
  ///   CalculatorPage.routeName,
  /// );
  /// ```
  static const String routeName = '/calculator';
  const CalculatorPage({super.key});

  @override
  CalculatorPageState createState() => CalculatorPageState();
}

/// This is might be interesting because the whole point is to use BlocProvider
/// and BlocBuilder. But turns out the TextFormField will reset whenever the
/// GlobalStates change it's because it's been rebuilted. The approach is to
/// make it Statefull Widget, to avoid that. And given the controll to init and
/// dispose locally.
class CalculatorPageState extends State<CalculatorPage> {
  /// Text field controller
  final inputController = TextEditingController();
  final inputScrollController = ScrollController();

  @override
  void dispose() {
    inputController.dispose();
    inputScrollController.dispose();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Bloc Provider for calculator cubit and calculator state
    return BlocProvider(
      create: (context) => CalculatorCubit(
        inputController: inputController,
        inputScrollController: inputScrollController,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        /// Use SafeArea because in iOS the screen is maxed up to the top
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Bloc builder for calculator cubit, notice only upper section
                /// that has BlocBuilder. Because the bottom section is passive
                BlocBuilder<CalculatorCubit, CalculatorState?>(
                  builder: (context, state) => CalculatorUpperSection(
                    inputController: inputController,
                    inputScrollController: inputScrollController,
                    state: state,
                  ),
                ),
                const SizedBox(
                  height: 16,
                  width: double.maxFinite,
                ),
                const CalculatorBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
