import 'package:flutter/material.dart';
import 'package:nail_shapes/src/almond_path_provider.dart';
import 'package:nail_shapes/src/ballerina_path_provider.dart';
import 'package:nail_shapes/src/nail_shape_type.dart';
import 'package:nail_shapes/src/round_path_provider.dart';
import 'package:nail_shapes/src/square_path_provider.dart';
import 'package:nail_shapes/src/squoval_path_provider.dart';

class NailShapePainter extends CustomPainter {
  NailShapePainter({required NailShapeType type, required Paint paint})
      : _type = type,
        _paint = paint;

  final NailShapeType _type;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    final path = switch (_type) {
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
      oldDelegate is! NailShapePainter ||
      oldDelegate._type != _type ||
      oldDelegate._paint != _paint;
}
