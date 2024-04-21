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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Almond',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: CustomPaint(
              painter: NailShapePainter(
                type: NailShapeType.almond,
                paint: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.red,
              ),
              size: const Size(100, 250),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Square',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: CustomPaint(
              foregroundPainter: NailShapePainter(
                type: NailShapeType.square,
                paint: Paint()
                  ..style = PaintingStyle.stroke
                  ..color = Colors.black,
              ),
              size: const Size(200, 300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Squoval',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: CustomPaint(
              foregroundPainter: _Painter(),
              painter: NailShapePainter(
                type: NailShapeType.squoval,
                paint: Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.cyan,
              ),
              size: const Size(150, 300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Round',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 300,
              child: ClipNailShape(
                type: NailShapeType.round,
                child: Text(
                  List.generate(300, (_) => 'a').join(''),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Ballerina',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Center(
            child: SizedBox(
              width: 180,
              height: 300,
              child: ClipNailShape(
                type: NailShapeType.ballerina,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lime,
                        Colors.green,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width / 2,
        height: size.width / 2,
      ),
      Paint()..color = Colors.blue.withOpacity(0.3),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
