import 'package:flutter/widgets.dart';

export 'package:design_language/src/reference/space/base_space_design_system.dart';

abstract class SpaceDesignSystem {
  double get base;
  EdgeInsets get pane;
  EdgeInsets get edge;
}
