import 'package:design_language/src/reference/duration/duration_design_system.dart';
import 'package:design_language/src/reference/easing/easing_design_system.dart';
import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/system/motion/motion_design_system.dart';

class Motion implements MotionDesignSystem {
  final Reference _ref;

  Motion({
    required Reference ref,
  }) : _ref = ref;

  @override
  DurationDesignSystem get duration => _ref.duration;

  @override
  EasingDesignSystem get easing => _ref.easing;
}
