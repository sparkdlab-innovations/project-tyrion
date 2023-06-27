import 'package:flutter/animation.dart';

abstract class EasingTypeDesignSystem {
  Curve get base;
  Curve get accelerate;
  Curve get decelerate;
}
