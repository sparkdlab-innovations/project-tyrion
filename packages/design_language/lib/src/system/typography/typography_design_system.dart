import 'package:flutter/widgets.dart';

export 'package:design_language/src/system/typography/font_style_design_system.dart';

abstract class TypographyDesignSystem {
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  TextStyle get headingLarge;
  TextStyle get headingMedium;
  TextStyle get headingSmall;

  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;

  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;
}
