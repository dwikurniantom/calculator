import 'package:smath/common/consts/component_key.dart';
import 'package:smath/common/utils/route_util.dart';
import 'package:smath/common/utils/theme_util.dart';
import 'package:smath/presentation/bloc/calculator/calculator_cubit.dart';
import 'package:smath/presentation/bloc/global/global_cubit.dart';
import 'package:smath/presentation/bloc/global/global_state.dart';
import 'package:smath/presentation/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculatorCubit calculatorCubit;
  late TextEditingController inputController;
  late ScrollController inputScrollController;

  setUp(() {
    AutomatedTestWidgetsFlutterBinding.ensureInitialized();

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
            title: 'Smath',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: state.themeUtil.lightTheme,
            darkTheme: state.themeUtil.darkTheme,
            home: const CalculatorPage(),
          );
        },
      ),
    ));
  }

  group(
    'CalculatorPage',
    () {
      testWidgets(
        'CalculatorKeyboard should render calculator buttons & interact',
        (WidgetTester tester) async {
          /// This code will dictate widget test screen size, height and width
          /// for testing. The default it will run on smaller screen size that
          /// can lead to failed testing. Which is not normal.
          // ignore: deprecated_member_use
          tester.binding.window.physicalSizeTestValue = const Size(
            430,
            1500,
          );

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

          /// Check if there is any 1 button
          expect(
            find.text('1'),
            findsOneWidget,
          );

          /// Check if there is any 2 button
          expect(
            find.text('2'),
            findsOneWidget,
          );

          /// Check if there is any 3 button
          expect(
            find.text('3'),
            findsOneWidget,
          );

          /// Check if there is any 4 button
          expect(
            find.text('4'),
            findsOneWidget,
          );

          /// Check if there is any 5 button
          expect(
            find.text('5'),
            findsOneWidget,
          );

          /// Check if there is any 6 button
          expect(
            find.text('6'),
            findsOneWidget,
          );

          /// Check if there is any 7 button
          expect(
            find.text('7'),
            findsOneWidget,
          );

          /// Check if there is any 8 button
          expect(
            find.text('8'),
            findsOneWidget,
          );

          /// Check if there is any 9 button
          expect(
            find.text('9'),
            findsOneWidget,
          );

          /// Check if there is any 0 button
          expect(
            find.text('0'),
            findsOneWidget,
          );

          /// Check if there is any . button
          expect(
            find.text('.'),
            findsOneWidget,
          );

          /// Optionally, we can tap the buttons to verify interactions.
          /// simulating 12 + 5.5
          /// Tap 1
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonOne,
              ),
            ),
          );

          /// Tap 2
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonTwo,
              ),
            ),
          );

          /// Tap +
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonAdd,
              ),
            ),
          );

          /// Tap 5
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonFive,
              ),
            ),
          );

          /// Tap .
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonDot,
              ),
            ),
          );

          /// Tap 5
          await tester.tap(
            find.byKey(
              const Key(
                ComponentKey.buttonFive,
              ),
            ),
          );

          /// Do pump, in case there is animation
          await tester.pumpAndSettle();

          /// Check if the current calculation is match
          expect(
            find.text('12+5.5'),
            findsOneWidget,
          );

          /// Check if the current result is match
          expect(
            find.text('17.5'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
