import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/system/color/color_design_system.dart'
    as dl_color;
import 'package:design_language/src/system/typography/typography_design_system.dart';
import 'package:flutter/widgets.dart';

class Typography implements TypographyDesignSystem {
  final Reference _ref;
  final dl_color.ColorDesignSystem _color;

  final double _fontLineHeightScale;
  final double _fontSizeScale;

  Typography({
    required Reference ref,
    required dl_color.ColorDesignSystem color,
    double? fontLineHeightScale = 1,
    double? fontSizeScale = 1,
  })  : _ref = ref,
        _color = color,
        _fontSizeScale = fontSizeScale!,
        _fontLineHeightScale = fontLineHeightScale!;

  FontWeight _getFontWeight(int fontWeight) {
    Map<int, FontWeight> asMap = FontWeight.values.asMap();
    if (asMap.containsKey(fontWeight)) {
      return asMap[fontWeight]!;
    } else {
      return FontWeight.normal;
    }
  }

  @override
  TextStyle get displayLarge => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 57 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 64 / 57 * _fontSizeScale,
        // letterSpacing: -0.25 * _fontSizeScale,
      );

  @override
  TextStyle get displayMedium => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 45 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 52 / 45 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );

  @override
  TextStyle get displaySmall => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 36 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 44 / 36 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );

  @override
  TextStyle get headingLarge => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 32 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 40 / 32 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );

  @override
  TextStyle get headingMedium => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 28 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 36 / 28 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );
  @override
  TextStyle get headingSmall => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 24 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 32 / 24 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );

  @override
  TextStyle get titleLarge => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.brand,
        fontSize: 22 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 28 / 22 * _fontSizeScale,
        // letterSpacing: 0 * _fontSizeScale,
      );

  @override
  TextStyle get titleMedium => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 20 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.medium),
        fontStyle: FontStyle.normal,
        height: 24 / 20 * _fontSizeScale,
        // letterSpacing: 0.15 * _fontSizeScale,
      );

  @override
  TextStyle get titleSmall => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 14 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.medium),
        fontStyle: FontStyle.normal,
        height: 20 / 14 * _fontSizeScale,
        // letterSpacing: 0.1 * _fontSizeScale,
      );

  @override
  TextStyle get labelLarge => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 14 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.medium),
        fontStyle: FontStyle.normal,
        height: 20 / 14 * _fontSizeScale,
        // letterSpacing: 0.1 * _fontSizeScale,
      );

  @override
  TextStyle get labelMedium => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 12 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.medium),
        fontStyle: FontStyle.normal,
        height: 16 / 12 * _fontSizeScale,
        // letterSpacing: 0.5 * _fontSizeScale,
      );

  @override
  TextStyle get labelSmall => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 11 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.medium),
        fontStyle: FontStyle.normal,
        height: 16 / 11 * _fontSizeScale,
        // letterSpacing: 0.5 * _fontSizeScale,
      );

  @override
  TextStyle get bodyLarge => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 16 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 24 / 16 * _fontSizeScale,
        // letterSpacing: 0.5 * _fontSizeScale,
      );

  @override
  TextStyle get bodyMedium => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 14 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 20 / 14 * _fontSizeScale,
        // letterSpacing: 0.25 * _fontSizeScale,
      );

  @override
  TextStyle get bodySmall => TextStyle(
        color: _color.onSurface,
        decoration: TextDecoration.none,
        fontFamily: _ref.typeface.family.plain,
        fontSize: 12 * _fontSizeScale,
        fontWeight: _getFontWeight(_ref.typeface.weight.regular),
        fontStyle: FontStyle.normal,
        height: 16 / 12 * _fontSizeScale,
        // letterSpacing: 0.4 * _fontSizeScale,
      );
}
