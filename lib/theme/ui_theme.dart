import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esportes_flutter/theme/ui_color.dart';
import 'package:esportes_flutter/theme/ui_text.dart';

class UiTheme {
  static void applySystemTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: UiColor.statusBar,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: UiColor.navigationBar,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: UiColor.appbar,
      elevation: 0,
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
