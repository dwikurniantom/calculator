import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/route_util.dart';
import '../../../common/utils/theme_util.dart';
import 'global_state.dart';

class GlobalBloc extends Cubit<GlobalState> {
  final globalMessanger = StreamController<dynamic>.broadcast();
  Stream get globalMessangerStream => globalMessanger.stream;

  GlobalBloc(super.initialState);

  void switchBrightness() {
    // Update state for theme mode
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }

  RouteUtil routeUtil(BuildContext context) => RouteUtil(
        context: context,
      );

  ThemeUtil themeUtil(BuildContext context) => ThemeUtil(
        context: context,
      );
}
