import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  })
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Select color must be less or equal than ${colorList.length - 1}');

  ThemeData themeData() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true
    ),
    brightness: isDarkMode?Brightness.dark:Brightness.light
  );
}
