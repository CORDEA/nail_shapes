import 'package:flutter/material.dart';
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

const _roundPath = RoundPathProvider();
const _squarePath = SquarePathProvider();
const _squovalPath = SquovalPathProvider();

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
      NailShapeType.square => _squarePath.provide(size),
      NailShapeType.round => _roundPath.provide(size),
      NailShapeType.squoval => _squovalPath.provide(size),
      NailShapeType.ballerina => throw UnimplementedError()
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
