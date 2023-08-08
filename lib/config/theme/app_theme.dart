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
  final bool isDarkmode;
  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false
  })
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Select color must be less or equal than ${colorList.length - 1}');

  ThemeData themeData() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    brightness: isDarkmode?Brightness.dark:Brightness.light
  );

  AppTheme copyWith(
    {int? selectedColor,bool? isDarkmode}
  ) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkmode:  isDarkmode ?? this.isDarkmode
  );
  
}
