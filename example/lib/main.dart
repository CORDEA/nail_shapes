import 'package:flutter/material.dart';
import 'package:nail_shapes/nail_shapes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox.fromSize(
          size: const Size(200, 400),
          child: NailShape(
            type: NailShapeType.ballerina,
            paint: Paint()
              ..color = Colors.red
              ..style = PaintingStyle.fill,
          ),
        ),
      ),
    );
  }
}
