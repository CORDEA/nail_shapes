import 'dart:ui';

import 'package:flutter/material.dart';

const _bottomPaddingScale = 0.08;
const _horizontalPaddingScale = 0.1;

class SquarePathProvider {
  const SquarePathProvider();

  Path provide(Size size) {
    final x = size.width;
    final y = size.height;
    final cx = size.width / 2;
    final cy = size.height / 2;
    final bottomPadding = size.height * _bottomPaddingScale;
    final horizontalPadding = size.width * _horizontalPaddingScale;
    return Path()
      ..moveTo(cx, y)
      ..cubicTo(
        cx / 2,
        y,
        cx / 5,
        y - bottomPadding * 0.2,
        cx / 8,
        y - bottomPadding * 0.5,
      )
      ..cubicTo(
        0,
        y - bottomPadding,
        0,
        y - bottomPadding * 1.5,
        0,
        y - bottomPadding * 2,
      )
      ..cubicTo(
        0,
        cy,
        horizontalPadding / 2,
        0,
        horizontalPadding,
        0,
      )
      ..cubicTo(
        horizontalPadding * 1.8,
        0,
        x - horizontalPadding * 1.8,
        0,
        x - horizontalPadding,
        0,
      )
      ..cubicTo(
        x - horizontalPadding / 2,
        0,
        x,
        cy,
        x,
        y - bottomPadding * 2,
      )
      ..cubicTo(
        x,
        y - bottomPadding * 1.5,
        x,
        y - bottomPadding,
        x - cx / 8,
        y - bottomPadding * 0.5,
      )
      ..cubicTo(
        x - cx / 5,
        y - bottomPadding * 0.2,
        cx * 3 / 2,
        y,
        cx,
        y,
      )
      ..close();
  }
}
