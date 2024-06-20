import 'package:calculator/common/utils/route_util.dart';
import 'package:calculator/common/utils/theme_util.dart';
import 'package:flutter/material.dart';

class GlobalState {
  final ThemeMode themeMode;
  final ThemeUtil themeUtil;
  final RouteUtil routeUtil;

  GlobalState({
    required this.themeMode,
    required this.themeUtil,
    required this.routeUtil,
  });

  GlobalState copyWith({
    ThemeMode? themeMode,
    ThemeUtil? themeUtil,
    RouteUtil? routeUtil,
  }) =>
      GlobalState(
        themeMode: themeMode ?? this.themeMode,
        themeUtil: themeUtil ?? this.themeUtil,
        routeUtil: routeUtil ?? this.routeUtil,
      );
}
