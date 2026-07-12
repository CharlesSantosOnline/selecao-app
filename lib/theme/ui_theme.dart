import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_text.dart';

class UiTheme {
  static const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: UiColor.background,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: UiColor.background,
    systemNavigationBarDividerColor: UiColor.background,
    systemNavigationBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarContrastEnforced: false,
  );

  static void applySystemTheme() {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: UiColor.appbar,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: systemUiOverlayStyle,
      iconTheme: IconThemeData(color: UiColor.primary),
      titleSpacing: 0,
    ),
    brightness: Brightness.light,
    fontFamily: 'poppins',
    scaffoldBackgroundColor: UiColor.background,
    textTheme: const TextTheme(
      displaySmall: UiText.displaySmall,
      displayMedium: UiText.displayMedium,
      displayLarge: UiText.displayLarge,
      titleLarge: UiText.titleLarge,
    ),
    dialogTheme: const DialogThemeData(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
      actionsPadding: EdgeInsets.all(16),
      backgroundColor: Color(0xFF0C2D54),
    ),
  );
}
