import 'dart:ui';

import 'package:design_language/src/reference/duration/duration.dart';
import 'package:design_language/src/reference/easing/easing.dart';
import 'package:design_language/src/reference/palette/palette.dart';
import 'package:design_language/src/reference/reference_design_systems.dart';
import 'package:design_language/src/reference/shape/shape.dart';
import 'package:design_language/src/reference/space/space.dart';
import 'package:design_language/src/reference/typeface/typeface.dart';

class Reference implements ReferenceDesignSystem {
  final Color? _primaryBase;
  final Color? _secondaryBase;
  final Color? _tertiaryBase;
  final Color? _neutralBase;
  final Color? _neutralVariantBase;
  final Color? _errorBase;

  final double? _spaceBase;

  final int? _durationBase;
  final int? _durationShortGap;
  final int? _durationMediumGap;
  final int? _durationLongGap;
  final int? _durationExtraLongGap;

  final String? _typefacePlainFontFamily;
  final String? _typefaceBrandFontFamily;
  final int? _typefaceRegularFontWeight;
  final int? _typefaceMediumFontWeight;
  final int? _typefaceBoldFontWeight;

  Reference({
    Color? primaryBase,
    Color? secondaryBase,
    Color? tertiaryBase,
    Color? neutralBase,
    Color? neutralVariantBase,
    Color? errorBase,
    double? spaceBase,
    int? durationBase,
    int? durationShortGap,
    int? durationMediumGap,
    int? durationLongGap,
    int? durationExtraLongGap,
    String? typefacePlainFontFamily,
    String? typefaceBrandFontFamily,
    int? typefaceRegularFontWeight,
    int? typefaceMediumFontWeight,
    int? typefaceBoldFontWeight,
  })  : _primaryBase = primaryBase,
        _secondaryBase = secondaryBase,
        _tertiaryBase = tertiaryBase,
        _neutralBase = neutralBase,
        _neutralVariantBase = neutralVariantBase,
        _errorBase = errorBase,
        _spaceBase = spaceBase,
        _durationBase = durationBase,
        _durationShortGap = durationShortGap,
        _durationMediumGap = durationMediumGap,
        _durationLongGap = durationLongGap,
        _durationExtraLongGap = durationExtraLongGap,
        _typefacePlainFontFamily = typefacePlainFontFamily,
        _typefaceBrandFontFamily = typefaceBrandFontFamily,
        _typefaceRegularFontWeight = typefaceRegularFontWeight,
        _typefaceMediumFontWeight = typefaceMediumFontWeight,
        _typefaceBoldFontWeight = typefaceBoldFontWeight;

  @override
  PaletteDesignSystem get palette => Palette(
        primary: _primaryBase,
        secondary: _secondaryBase,
        tertiary: _tertiaryBase,
        neutral: _neutralBase,
        neutralVariant: _neutralVariantBase,
        error: _errorBase,
      );

  @override
  BaseSpaceDesignSystem get space => Space(
        base: _spaceBase,
      );

  @override
  EasingDesignSystem get easing => Easing();

  @override
  DurationDesignSystem get duration => Duration(
        base: _durationBase,
        shortGap: _durationShortGap,
        mediumGap: _durationMediumGap,
        longGap: _durationLongGap,
        extraLongGap: _durationExtraLongGap,
      );

  @override
  ShapeDesignSystem get shape => Shape();

  @override
  TypefaceDesignSystem get typeface => Typeface(
        plainFontFamily: _typefacePlainFontFamily,
        brandFontFamily: _typefaceBrandFontFamily,
        regularFontWeight: _typefaceRegularFontWeight,
        mediumFontWeight: _typefaceMediumFontWeight,
        boldFontWeight: _typefaceBoldFontWeight,
      );
}
