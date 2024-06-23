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

          expect(
            find.text('1'),
            findsOneWidget,
          );

          expect(
            find.text('2'),
            findsOneWidget,
          );

          expect(
            find.text('3'),
            findsOneWidget,
          );

          expect(
            find.text('4'),
            findsOneWidget,
          );
          expect(
            find.text('5'),
            findsOneWidget,
          );

          expect(
            find.text('6'),
            findsOneWidget,
          );

          expect(
            find.text('7'),
            findsOneWidget,
          );

          expect(
            find.text('8'),
            findsOneWidget,
          );

          expect(
            find.text('9'),
            findsOneWidget,
          );

          expect(
            find.text('0'),
            findsOneWidget,
          );

          expect(
            find.text('.'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
