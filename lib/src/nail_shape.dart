import 'package:flutter/material.dart';
import 'package:nail_shapes/src/almond_path_provider.dart';
import 'package:nail_shapes/src/ballerina_path_provider.dart';
import 'package:nail_shapes/src/nail_shape_type.dart';
import 'package:nail_shapes/src/round_path_provider.dart';
import 'package:nail_shapes/src/square_path_provider.dart';
import 'package:nail_shapes/src/squoval_path_provider.dart';

class NailShape extends StatelessWidget {
  const NailShape({
    super.key,
    required this.type,
    required this.paint,
  });

  final NailShapeType type;
  final Paint paint;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _NailShape(type, paint));
  }
}

class _NailShape extends CustomPainter {
  _NailShape(this.type, this._paint);

  final NailShapeType type;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    final path = switch (type) {
      NailShapeType.almond => almondPath.provide(size),
      NailShapeType.square => squarePath.provide(size),
      NailShapeType.round => roundPath.provide(size),
      NailShapeType.squoval => squovalPath.provide(size),
      NailShapeType.ballerina => ballerinaPath.provide(size),
    };
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is! _NailShape ||
      oldDelegate.type != type ||
      oldDelegate._paint != _paint;
}
