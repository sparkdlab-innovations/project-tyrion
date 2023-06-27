import 'package:design_language/src/reference/shape/shape_design_system.dart';
import 'package:flutter/rendering.dart';

class Shape implements ShapeDesignSystem {
  final double _cornerBase;

  Shape({
    double? cornerBase = 4,
  }) : _cornerBase = cornerBase!;

  @override
  CornerDesignSystem get corner => Corner(base: _cornerBase);
}

class Corner implements CornerDesignSystem {
  final double _base;

  Corner({
    double base = 4,
  }) : _base = base;

  @override
  BorderRadius get none => BorderRadius.zero;

  @override
  BorderRadius get extraSmall => BorderRadius.circular(_base);
  @override
  BorderRadius get extraSmallTop => BorderRadius.only(
        topLeft: Radius.circular(_base),
        topRight: Radius.circular(_base),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      );

  @override
  BorderRadius get small => BorderRadius.circular(_base * 2);

  @override
  BorderRadius get medium => BorderRadius.circular(_base * 3);

  @override
  BorderRadius get large => BorderRadius.circular(_base * 4);
  @override
  BorderRadius get largeEnd => BorderRadius.only(
        topLeft: Radius.circular(_base * 4),
        topRight: Radius.zero,
        bottomLeft: Radius.circular(_base * 4),
        bottomRight: Radius.zero,
      );
  @override
  BorderRadius get largeTop => BorderRadius.only(
        topLeft: Radius.circular(_base * 4),
        topRight: Radius.circular(_base * 4),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      );

  @override
  BorderRadius get extraLarge => BorderRadius.circular(_base * 7);
  @override
  BorderRadius get extraLargeTop => BorderRadius.only(
        topLeft: Radius.circular(_base * 7),
        topRight: Radius.circular(_base * 7),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      );

  @override
  BorderRadius get circle => BorderRadius.circular(10000);
}
