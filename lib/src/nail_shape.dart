import 'package:flutter/material.dart';
import 'package:nail_shapes/src/almond_path_provider.dart';
import 'package:nail_shapes/src/ballerina_path_provider.dart';
import 'package:nail_shapes/src/nail_shape_type.dart';
import 'package:nail_shapes/src/round_path_provider.dart';
import 'package:nail_shapes/src/square_path_provider.dart';
import 'package:nail_shapes/src/squoval_path_provider.dart';

class NailShape extends StatelessWidget {
  const NailShape({super.key, required this.type});

  final NailShapeType type;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _NailShape(type));
  }
}

class _NailShape extends CustomPainter {
  _NailShape(this.type);

  final NailShapeType type;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    canvas.drawColor(Colors.red, BlendMode.clear);
    final path = switch (type) {
      NailShapeType.almond => almondPath.provide(size),
      NailShapeType.square => squarePath.provide(size),
      NailShapeType.round => roundPath.provide(size),
      NailShapeType.squoval => squovalPath.provide(size),
      NailShapeType.ballerina => ballerinaPath.provide(size),
    };
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.red
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
