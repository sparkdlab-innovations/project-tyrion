import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/reference/shape/shape_design_system.dart';
import 'package:design_language/src/reference/space/space_design_system.dart';
import 'package:design_language/src/system/dimension/dimension_design_system.dart';

class Dimension implements DimensionDesignSystem {
  final Reference _ref;

  Dimension({
    required Reference ref,
  }) : _ref = ref;

  @override
  ShapeDesignSystem get shape => _ref.shape;

  static WindowClass get windowClass => DimensionDesignSystem.windowClass;

  @override
  double get baseDimension {
    switch (windowClass) {
      case WindowClass.medium:
        return _ref.space.medium.base;
      case WindowClass.expanded:
        return _ref.space.expanded.base;
      default:
        return _ref.space.compact.base;
    }
  }

  @override
  SpaceDesignSystem get space {
    switch (windowClass) {
      case WindowClass.medium:
        return _ref.space.medium;
      case WindowClass.expanded:
        return _ref.space.expanded;
      default:
        return _ref.space.compact;
    }
  }
}
