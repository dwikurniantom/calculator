import 'package:smath/presentation/pages/calculator_page.dart';
import 'package:flutter/material.dart';

import '../consts/component_key.dart';

class RouteUtil {
  final BuildContext context;

  RouteUtil({
    required this.context,
  });

  /// This global key is used for retrieve current context, the usage is not yet
  /// defined. But i like to add it just in case
  static var navigatorKey = GlobalKey<NavigatorState>();

  /// This is a constant for initial route, the initial route itself is the
  /// calculator page (straight to calculator view)
  String get initialRoute => CalculatorPage.routeName;

  /// This is map of all routes, every single page that will be used in the
  /// future must be added to this map routes.
  Map<String, Widget Function(BuildContext)> get routes => {
        /// Callculator page route
        CalculatorPage.routeName: (context) => const CalculatorPage(
              key: Key(ComponentKey.callculatorPage),
            ),
      };
}
