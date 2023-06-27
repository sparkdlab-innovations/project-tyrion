import 'package:design_language/src/reference/space/space_design_system.dart';
import 'package:flutter/rendering.dart';

class Space implements BaseSpaceDesignSystem {
  static const int compactBreakpoint = 600;
  static const int expandedBreakpoint = 840;

  final double _base;

  Space({
    double? base = 6,
  }) : _base = base!;

  @override
  SpaceDesignSystem get compact => CompactSpace(base: (_base / 3) * 2);

  @override
  SpaceDesignSystem get medium => MediumSpace(base: _base);

  @override
  SpaceDesignSystem get expanded => ExpandedSpace(base: (_base / 3) * 4);
}

class CompactSpace implements SpaceDesignSystem {
  final double _base;

  CompactSpace({
    double base = 4,
  }) : _base = base;

  @override
  double get base => _base;

  @override
  EdgeInsets get pane => EdgeInsets.symmetric(
        horizontal: _base * 2,
        vertical: 0,
      );

  @override
  EdgeInsets get edge => EdgeInsets.only(
        left: _base * 4,
        right: _base * 4,
        top: 0,
        bottom: 0,
      );
}

class MediumSpace implements SpaceDesignSystem {
  final double _base;

  MediumSpace({
    double base = 6,
  }) : _base = base;

  @override
  double get base => _base;

  @override
  EdgeInsets get pane => EdgeInsets.symmetric(
        horizontal: _base * 2,
        vertical: 0,
      );

  @override
  EdgeInsets get edge => EdgeInsets.only(
        left: _base * 4,
        right: _base * 4,
        top: 0,
        bottom: 0,
      );
}

class ExpandedSpace implements SpaceDesignSystem {
  final double _base;

  ExpandedSpace({
    double base = 8,
  }) : _base = base;

  @override
  double get base => _base;

  @override
  EdgeInsets get pane => EdgeInsets.symmetric(
        horizontal: _base * 2,
        vertical: 0,
      );

  @override
  EdgeInsets get edge => EdgeInsets.only(
        left: 0,
        right: _base * 3,
        top: 0,
        bottom: 0,
      );
}
