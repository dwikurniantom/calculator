import 'package:calculator/common/utils/route_util.dart';
import 'package:calculator/common/utils/theme_util.dart';
import 'package:calculator/presentation/bloc/global/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/global/global_cubit.dart';

void main() {
  runApp(const IonMobilityCalculatorApp());
}

class IonMobilityCalculatorApp extends StatelessWidget {
  const IonMobilityCalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalBloc(
        GlobalState(
          themeMode: ThemeMode.light,
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
    );
  }
}
