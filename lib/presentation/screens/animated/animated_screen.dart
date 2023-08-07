import 'dart:math' show Random;
import 'package:flutter/material.dart';

const colors = <Color>[
  Colors.teal,
  Colors.red,
  Colors.blue,
  Colors.black,
  Colors.pink,
  Colors.amberAccent,
  Colors.orange,
  Colors.purple
];

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(500) + 120;
    // final index = random.nextInt(colors.length);
    color = Color.fromARGB(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    // print(index);
    borderRadius = random.nextInt(100) + 20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape, //es el mismo numero de argumentos
        child: Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
