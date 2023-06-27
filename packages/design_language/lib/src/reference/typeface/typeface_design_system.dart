import 'package:design_language/src/reference/typeface/font_family_design_system.dart';
import 'package:design_language/src/reference/typeface/font_weight_design_system.dart';

export 'package:design_language/src/reference/typeface/font_family_design_system.dart';
export 'package:design_language/src/reference/typeface/font_weight_design_system.dart';

abstract class TypefaceDesignSystem {
  FontFamilyDesignSystem get family;

  FontWeightDesignSystem get weight;
}
