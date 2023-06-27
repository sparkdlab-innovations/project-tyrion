import 'package:design_language/src/reference/duration/duration_design_system.dart';
import 'package:design_language/src/reference/easing/easing_design_system.dart';

abstract class MotionDesignSystem {
  DurationDesignSystem get duration;
  EasingDesignSystem get easing;
}
