import 'dart:ui';

import 'package:design_language/design_language.dart';
import 'package:design_language/src/reference/space/space.dart';

export 'package:design_language/src/system/dimension/window_class.enum.dart';

abstract class DimensionDesignSystem {
  ShapeDesignSystem get shape;

  static WindowClass get windowClass {
    Size size = PlatformDispatcher.instance.implicitView != null
        ? PlatformDispatcher.instance.implicitView!.physicalSize /
            PlatformDispatcher.instance.implicitView!.devicePixelRatio
        : Size(0, 0);
    if (size.width > Space.expandedBreakpoint && size.width > size.height) {
      return WindowClass.expanded;
    } else if (size.width > Space.compactBreakpoint) {
      return WindowClass.medium;
    } else {
      return WindowClass.compact;
    }
  }

  double get baseDimension;

  SpaceDesignSystem get space;
}
