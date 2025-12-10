import 'package:flutter/material.dart';

class AppColorSchemes {
  static const light = ColorScheme.light(
    primary: Colors.teal,
    secondary: Colors.grey,
    surface: Colors.white, // Default Background Color
    onSurface: Colors.black, // Default Text Color
  );

  static const dark = ColorScheme.dark(
    primary: Colors.teal,
    secondary: Colors.red,
    surface: Colors.black, // Default Background Color
    onSurface: Colors.white, // Default Text Color
  );
}
