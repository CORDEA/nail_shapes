import 'package:flutter/material.dart';
import 'package:nail_shapes/src/almond_path_provider.dart';
import 'package:nail_shapes/src/ballerina_path_provider.dart';
import 'package:nail_shapes/src/nail_shape_type.dart';
import 'package:nail_shapes/src/round_path_provider.dart';
import 'package:nail_shapes/src/square_path_provider.dart';
import 'package:nail_shapes/src/squoval_path_provider.dart';

class ClipNailShape extends StatelessWidget {
  const ClipNailShape({
    super.key,
    required this.type,
    required this.child,
    this.clipBehavior = Clip.antiAlias,
  });

  final NailShapeType type;
  final Clip clipBehavior;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _Clipper(type),
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  const _Clipper(this.type);

  final NailShapeType type;

  @override
  Path getClip(Size size) {
    return switch (type) {
      NailShapeType.almond => almondPath.provide(size),
      NailShapeType.square => squarePath.provide(size),
      NailShapeType.round => roundPath.provide(size),
      NailShapeType.squoval => squovalPath.provide(size),
      NailShapeType.ballerina => ballerinaPath.provide(size),
    };
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    if (oldClipper.runtimeType != _Clipper) {
      return true;
    }
    final old = oldClipper as _Clipper;
    return old.type != type;
  }
}
