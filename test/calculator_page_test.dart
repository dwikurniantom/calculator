import 'package:calculator/common/consts/component_key.dart';
import 'package:calculator/common/utils/route_util.dart';
import 'package:calculator/common/utils/theme_util.dart';
import 'package:calculator/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:calculator/presentation/bloc/global/global_cubit.dart';
import 'package:calculator/presentation/bloc/global/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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

  Future<void> pumpCalculatorPage(WidgetTester tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => GlobalBloc(
        GlobalState(
          themeMode: ThemeMode.system,
          themeUtil: ThemeUtil(context: context),
          routeUtil: RouteUtil(context: context),
        ),
      ),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Simple Calculator',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: state.themeUtil.lightTheme,
            darkTheme: state.themeUtil.darkTheme,
            routes: state.routeUtil.routes,
            initialRoute: state.routeUtil.initialRoute,
          );
        },
      ),
    ));
  }

  group(
    'CalculatorPage ',
    () {
      testWidgets(
        'CalculatorKeyboard should render calculator buttons',
        (WidgetTester tester) async {
          // Build the widget within a BlocProvider.
          await pumpCalculatorPage(tester);

          /// Check if there is any % (percent) operands
          expect(
            find.text('%'),
            findsOneWidget,
          );

          /// Check if there is any + (Additive) operands
          expect(
            find.text('+'),
            findsOneWidget,
          );

          /// Check if there is any × (Multiplicative) operands
          expect(
            find.text('×'),
            findsOneWidget,
          );

          /// Check if there is any ÷ (divider) operands
          expect(
            find.text('÷'),
            findsOneWidget,
          );

          /// Check if there is any - (substract) operands
          expect(
            find.text('-'),
            findsOneWidget,
          );

          /// Check if there is any backspace button
          expect(
            find.byIcon(Icons.backspace),
            findsOneWidget,
          );

          await tester.pump();

          /// Optionally, we can tap the buttons to verify interactions.
          /// simulating 12 + 5.5
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonOne,
              ),
            ),
          );

          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonTwo,
              ),
            ),
          );

          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonAdd,
              ),
            ),
          );

          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonFive,
              ),
            ),
          );

          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonDot,
              ),
            ),
          );

          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonFive,
              ),
            ),
          );

          await tester.pumpAndSettle();

          expect(
            find.text('12+5.5'),
            findsOneWidget,
          );

          expect(
            find.text('17.5'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
