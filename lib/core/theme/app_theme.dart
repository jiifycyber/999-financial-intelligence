import 'package:flutter/material.dart';

class AppTheme {
  static const bg = Color(0xFF050812);
  static const panel = Color(0xFF0A1020);
  static const panel2 = Color(0xFF10182A);
  static const border = Color(0xFF24334C);

  static const purple = Color(0xFF9C63FF);
  static const blue = Color(0xFF4A8CFF);
  static const cyan = Color(0xFF24D9D0);
  static const green = Color(0xFF49E37D);
  static const orange = Color(0xFFFFB547);
  static const red = Color(0xFFFF5D73);

  static const text = Color(0xFFF5F7FB);
  static const muted = Color(0xFF8B99B2);

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: purple,
        brightness: Brightness.dark,
      ),
      cardColor: panel,
      dividerColor: border,
    );
  }
}
