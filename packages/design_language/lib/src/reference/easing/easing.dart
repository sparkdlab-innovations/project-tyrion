import 'package:design_language/src/reference/easing/easing_design_system.dart';
import 'package:flutter/animation.dart';

class Easing implements EasingDesignSystem {
  @override
  Curve get linear => Cubic(0, 0, 1, 1);

  @override
  EasingTypeDesignSystem get standard => StandardEasing();
  @override
  EasingTypeDesignSystem get emphasized => EmphasizedEasing();
  @override
  EasingTypeDesignSystem get legacy => LegacyEasing();
}

class StandardEasing implements EasingTypeDesignSystem {
  @override
  Curve get base => Cubic(0.2, 0, 0, 1);
  @override
  Curve get accelerate => Cubic(0.3, 0, 1, 1);
  @override
  Curve get decelerate => Cubic(0, 0, 0, 1);
}

class EmphasizedEasing implements EasingTypeDesignSystem {
  @override
  Curve get base => Cubic(0.2, 0, 0, 1);
  @override
  Curve get accelerate => Cubic(0.05, 0.7, 0.1, 1);
  @override
  Curve get decelerate => Cubic(0.3, 0, 0.8, 0.15);
}

class LegacyEasing implements EasingTypeDesignSystem {
  @override
  Curve get base => Cubic(0.4, 0, 0.2, 1);
  @override
  Curve get accelerate => Cubic(0.0, 0, 0.2, 1);
  @override
  Curve get decelerate => Cubic(0.4, 0, 1.0, 1);
}
