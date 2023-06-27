import 'package:design_language/src/reference/duration/duration_design_system.dart';
import 'package:design_language/src/reference/easing/easing_design_system.dart';
import 'package:design_language/src/reference/palette/palette_design_system.dart';
import 'package:design_language/src/reference/shape/shape_design_system.dart';
import 'package:design_language/src/reference/space/space_design_system.dart';
import 'package:design_language/src/reference/typeface/typeface_design_system.dart';

export 'package:design_language/src/reference/duration/duration_design_system.dart';
export 'package:design_language/src/reference/easing/easing_design_system.dart';
export 'package:design_language/src/reference/palette/palette_design_system.dart';
export 'package:design_language/src/reference/shape/shape_design_system.dart';
export 'package:design_language/src/reference/space/space_design_system.dart';
export 'package:design_language/src/reference/typeface/typeface_design_system.dart';

abstract class ReferenceDesignSystem {
  PaletteDesignSystem get palette;

  BaseSpaceDesignSystem get space;

  EasingDesignSystem get easing;

  DurationDesignSystem get duration;

  ShapeDesignSystem get shape;

  TypefaceDesignSystem get typeface;
}
