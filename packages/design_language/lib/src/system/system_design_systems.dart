import 'package:design_language/src/system/color/color_design_system.dart';
import 'package:design_language/src/system/dimension/dimension_design_system.dart';
import 'package:design_language/src/system/motion/motion_design_system.dart';
import 'package:design_language/src/system/typography/typography_design_system.dart';

export 'package:design_language/src/system/color/color_design_system.dart';
export 'package:design_language/src/system/dimension/dimension_design_system.dart';
export 'package:design_language/src/system/motion/motion_design_system.dart';
export 'package:design_language/src/system/typography/typography_design_system.dart';

abstract class SystemDesignSystem {
  ColorDesignSystem get color;

  DimensionDesignSystem get dimension;

  MotionDesignSystem get motion;

  TypographyDesignSystem get typography;
}
