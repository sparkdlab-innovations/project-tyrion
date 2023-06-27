import 'dart:ui';

import 'package:design_language/src/design_language_design_system.dart';
import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/system/system.dart';

class DesignLanguage implements DesignLanguageDesignSystem {
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

  final bool? _isDark;

  final double? _typographyFontLineHeightScale;
  final double? _typographyFontSizeScale;

  DesignLanguage({
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
    double? tyopgraphyFontLineHeightScale,
    double? typographyFontSizeScale,
    bool? isDark,
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
        _typefaceBoldFontWeight = typefaceBoldFontWeight,
        _typographyFontLineHeightScale = tyopgraphyFontLineHeightScale,
        _typographyFontSizeScale = typographyFontSizeScale,
        _isDark = isDark;

  @override
  bool get isDark => _isDark ?? true;

  @override
  Reference get ref => Reference(
        primaryBase: _primaryBase,
        secondaryBase: _secondaryBase,
        tertiaryBase: _tertiaryBase,
        neutralBase: _neutralBase,
        neutralVariantBase: _neutralVariantBase,
        errorBase: _errorBase,
        spaceBase: _spaceBase,
        durationBase: _durationBase,
        durationShortGap: _durationShortGap,
        durationMediumGap: _durationMediumGap,
        durationLongGap: _durationLongGap,
        durationExtraLongGap: _durationExtraLongGap,
        typefacePlainFontFamily: _typefacePlainFontFamily,
        typefaceBrandFontFamily: _typefaceBrandFontFamily,
        typefaceRegularFontWeight: _typefaceRegularFontWeight,
        typefaceMediumFontWeight: _typefaceMediumFontWeight,
        typefaceBoldFontWeight: _typefaceBoldFontWeight,
      );

  @override
  System get sys => System(
        ref: ref,
        isDark: _isDark,
        fontLineHeightScale: _typographyFontLineHeightScale,
        fontSizeScale: _typographyFontSizeScale,
      );
}
