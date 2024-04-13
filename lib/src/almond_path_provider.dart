import 'dart:ui';

import 'package:flutter/material.dart';

const almondPath = AlmondPathProvider();

const _bottomPaddingScale = 0.08;
const _topPaddingScale = 0.35;
const _horizontalPaddingScale = 0.05;

class AlmondPathProvider {
  const AlmondPathProvider();

  Path provide(Size size) {
    final x = size.width;
    final y = size.height;
    final cx = size.width / 2;
    final cy = size.height / 2;
    final bottomPadding = size.height * _bottomPaddingScale;
    final horizontalPadding = size.width * _horizontalPaddingScale;
    final topPadding = size.height * _topPaddingScale;
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
        topPadding * 1.05,
        horizontalPadding,
        topPadding,
      )
      ..cubicTo(
        horizontalPadding * 2,
        topPadding * 0.8,
        cx - cx / 9,
        0,
        cx,
        0,
      )
      ..cubicTo(
        cx + cx / 9,
        0,
        x - horizontalPadding * 2,
        topPadding * 0.8,
        x - horizontalPadding,
        topPadding,
      )
      ..cubicTo(
        x - horizontalPadding / 2,
        topPadding * 1.05,
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
