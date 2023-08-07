import 'package:flutter/material.dart';
const _colors = <Color> [
  Colors.blue,
  Colors.red,
  Colors.yellow
];
class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen' ;
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: _colors[index]
            ),
          );
      },),
    );
  }
}