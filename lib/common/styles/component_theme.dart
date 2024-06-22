import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class ComponentTheme {
  final BuildContext context;
  final ColorScheme colorScheme;

  ComponentTheme({
    required this.context,
    required this.colorScheme,
  });

  AppBarTheme get appBarThemeData => const AppBarTheme(
      // elevation: 0,
      // backgroundColor: colorScheme.background,
      // foregroundColor: colorScheme.primary,
      // surfaceTintColor: colorScheme.background,
      );

  IconThemeData get iconThemeData => IconThemeData(
        color: colorScheme.onSurface,
      );

  NavigationBarThemeData get navigationBarThemeData =>
      const NavigationBarThemeData(
          // height: 64,
          );

  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.primary.withOpacity(0.35),
        backgroundColor: colorScheme.surface,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurfaceVariant.withOpacity(0.50),
          ),
        ),
      );

  DividerThemeData get dividerThemeData => DividerThemeData(
        color: colorScheme.onSurface.withOpacity(0.25),
      );

  ChipThemeData get chipThemeData => ChipThemeData(
        shape: StadiumBorder(
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
        ),
        elevation: 0,
        pressElevation: 0,
      );

  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          splashFactory: InkRipple.splashFactory,
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withOpacity(0.5);
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return colorScheme.primary;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onPrimary;
              } else if (states.contains(WidgetState.disabled)) {
                return colorScheme.onSurface.withOpacity(0.38);
              } else {
                return colorScheme.onPrimary;
              }
            },
          ),
          elevation: ButtonStyleButton.allOrNull(0.0),
        ),
      );

  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.onSurface;
              } else if (states.contains(WidgetState.disabled)) {
                return colorScheme.onSurface.withOpacity(0.38);
              } else {
                return colorScheme.onSurface;
              }
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (states) {
              return BorderSide(
                color: colorScheme.onSurface.withOpacity(0.25),
                width: 1,
              );
            },
          ),
        ),
      );

  PopupMenuThemeData get popupMenuThemeData => PopupMenuThemeData(
        color: colorScheme.surface,
        elevation: 0.75,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      );

  ToggleButtonsThemeData get toggleButtonsThemeData => ToggleButtonsThemeData(
        borderColor: colorScheme.onSurface.withOpacity(0.38),
        selectedBorderColor: colorScheme.primary,
        constraints: const BoxConstraints.tightForFinite(
          height: 38,
          width: 100,
        ),
      );

  SnackBarThemeData get snackBarThemeData => SnackBarThemeData(
        actionTextColor: colorScheme.inversePrimary,
        behavior: SnackBarBehavior.floating,
      );

  TooltipThemeData get tooltipThemeData => TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
        ),
      );

  DropdownMenuThemeData get dropdownMenuThemeData => DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            colorScheme.surface,
          ),
          elevation: const WidgetStatePropertyAll(
            0.75,
          ),
        ),
      );
}
