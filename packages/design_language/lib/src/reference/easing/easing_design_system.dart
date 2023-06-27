import 'package:design_language/src/reference/easing/easing_type_design_system.dart';
import 'package:flutter/animation.dart';

export 'package:design_language/src/reference/easing/easing_type_design_system.dart';

abstract class EasingDesignSystem {
  Curve get linear;

  EasingTypeDesignSystem get standard;
  EasingTypeDesignSystem get emphasized;
  EasingTypeDesignSystem get legacy;
}
