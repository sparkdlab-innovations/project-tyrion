import 'package:design_language/design_language.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class AppTheme {
  static DesignLanguage? _dl;

  static Color _primaryBase = Color(0xff00539b);
  static Color _secondaryBase = Color(0xFF274268);
  static Color _tertiaryBase = Color(0xff7b377f);
  static Color _neutralBase = Color(0xffb4b9c4);
  static Color _neutralVariantBase = Color(0xffc4b4c0);
  static Color _errorBase = Color(0xffba1a1a);

  static const double _spaceBase = 6;

  static const int _durationBase = 50;
  static const int _durationShortGap = 50;
  static const int _durationMediumGap = 50;
  static const int _durationLongGap = 50;
  static const int _durationExtraLongGap = 100;

  static const String _typefacePlainFontFamily = 'Roboto';
  static const String _typefaceBrandFontFamily = 'Roboto';
  static const int _typefaceRegularFontWeight = 400;
  static const int _typefaceMediumFontWeight = 500;
  static const int _typefaceBoldFontWeight = 700;

  static const double _tyopgraphyFontLineHeightScale = 1;
  static const double _typographyFontSizeScale = 1;

  static DesignLanguage init({
    required bool isDark,
    CorePalette? corePalete,
  }) {
    if (corePalete != null) {
      _primaryBase = Color(
          Blend.harmonize(_primaryBase.value, corePalete.primary.get(40)));
      _secondaryBase = Color(
          Blend.harmonize(_secondaryBase.value, corePalete.secondary.get(40)));
      _tertiaryBase = Color(
          Blend.harmonize(_tertiaryBase.value, corePalete.tertiary.get(40)));
      _neutralBase = Color(
          Blend.harmonize(_neutralBase.value, corePalete.neutral.get(40)));
      _neutralVariantBase = Color(Blend.harmonize(
          _neutralVariantBase.value, corePalete.neutralVariant.get(40)));
      _errorBase =
          Color(Blend.harmonize(_errorBase.value, corePalete.error.get(40)));
    }

    _dl = DesignLanguage(
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
      tyopgraphyFontLineHeightScale: _tyopgraphyFontLineHeightScale,
      typographyFontSizeScale: _typographyFontSizeScale,
      isDark: isDark,
    );
    return _dl!;
  }

  static DesignLanguage get({
    required bool isDark,
  }) =>
      DesignLanguage(
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
        tyopgraphyFontLineHeightScale: _tyopgraphyFontLineHeightScale,
        typographyFontSizeScale: _typographyFontSizeScale,
        isDark: isDark,
      );

  static DesignLanguage get dl => _dl ?? get(isDark: isDark);

  static bool get isDark => _dl?.isDark ??
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light
      ? false
      : true;

  static WindowClass get windowClass => DimensionDesignSystem.windowClass;

  static ColorScheme get lightColorScheme {
    DesignLanguage dl = get(isDark: false);
    return ColorScheme(
      brightness: Brightness.light,
      primary: dl.sys.color.primary,
      onPrimary: dl.sys.color.onPrimary,
      primaryContainer: dl.sys.color.primaryContainer,
      onPrimaryContainer: dl.sys.color.onPrimaryContainer,
      secondary: dl.sys.color.secondary,
      onSecondary: dl.sys.color.onSecondary,
      secondaryContainer: dl.sys.color.secondaryContainer,
      onSecondaryContainer: dl.sys.color.onSecondaryContainer,
      tertiary: dl.sys.color.tertiary,
      onTertiary: dl.sys.color.onTertiary,
      tertiaryContainer: dl.sys.color.tertiaryContainer,
      onTertiaryContainer: dl.sys.color.onTertiaryContainer,
      error: dl.sys.color.error,
      errorContainer: dl.sys.color.errorContainer,
      onError: dl.sys.color.onError,
      onErrorContainer: dl.sys.color.onErrorContainer,
      background: dl.sys.color.background,
      onBackground: dl.sys.color.onBackground,
      outline: dl.sys.color.outline,
      onInverseSurface: dl.sys.color.inverseOnSurface,
      inverseSurface: dl.sys.color.inverseSurface,
      inversePrimary: dl.sys.color.inversePrimary,
      shadow: dl.sys.color.shadow,
      surfaceTint: dl.sys.color.surfaceTint,
      outlineVariant: dl.sys.color.outlineVariant,
      scrim: dl.sys.color.scrim,
      surface: dl.sys.color.surface,
      onSurface: dl.sys.color.onSurface,
      surfaceVariant: dl.sys.color.surfaceVariant,
      onSurfaceVariant: dl.sys.color.onSurfaceVariant,
    );
  }

  static ColorScheme get darkColorScheme {
    DesignLanguage dl = get(isDark: true);
    return ColorScheme(
      brightness: Brightness.light,
      primary: dl.sys.color.primary,
      onPrimary: dl.sys.color.onPrimary,
      primaryContainer: dl.sys.color.primaryContainer,
      onPrimaryContainer: dl.sys.color.onPrimaryContainer,
      secondary: dl.sys.color.secondary,
      onSecondary: dl.sys.color.onSecondary,
      secondaryContainer: dl.sys.color.secondaryContainer,
      onSecondaryContainer: dl.sys.color.onSecondaryContainer,
      tertiary: dl.sys.color.tertiary,
      onTertiary: dl.sys.color.onTertiary,
      tertiaryContainer: dl.sys.color.tertiaryContainer,
      onTertiaryContainer: dl.sys.color.onTertiaryContainer,
      error: dl.sys.color.error,
      errorContainer: dl.sys.color.errorContainer,
      onError: dl.sys.color.onError,
      onErrorContainer: dl.sys.color.onErrorContainer,
      background: dl.sys.color.background,
      onBackground: dl.sys.color.onBackground,
      outline: dl.sys.color.outline,
      onInverseSurface: dl.sys.color.inverseOnSurface,
      inverseSurface: dl.sys.color.inverseSurface,
      inversePrimary: dl.sys.color.inversePrimary,
      shadow: dl.sys.color.shadow,
      surfaceTint: dl.sys.color.surfaceTint,
      outlineVariant: dl.sys.color.outlineVariant,
      scrim: dl.sys.color.scrim,
      surface: dl.sys.color.surface,
      onSurface: dl.sys.color.onSurface,
      surfaceVariant: dl.sys.color.surfaceVariant,
      onSurfaceVariant: dl.sys.color.onSurfaceVariant,
    );
  }

  static TextTheme get lightTextTheme {
    DesignLanguage dl = get(isDark: false);
    return TextTheme(
      displayLarge: dl.sys.typography.displayLarge,
      displayMedium: dl.sys.typography.displayMedium,
      displaySmall: dl.sys.typography.displaySmall,
      headlineLarge: dl.sys.typography.headingLarge,
      headlineMedium: dl.sys.typography.headingMedium,
      headlineSmall: dl.sys.typography.headingSmall,
      titleLarge: dl.sys.typography.titleLarge,
      titleMedium: dl.sys.typography.titleMedium,
      titleSmall: dl.sys.typography.titleSmall,
      labelLarge: dl.sys.typography.labelLarge,
      labelMedium: dl.sys.typography.labelMedium,
      labelSmall: dl.sys.typography.labelSmall,
      bodyLarge: dl.sys.typography.bodyLarge,
      bodyMedium: dl.sys.typography.bodyMedium,
      bodySmall: dl.sys.typography.bodySmall,
    );
  }

  static TextTheme get darkTextTheme {
    DesignLanguage dl = get(isDark: true);
    return TextTheme(
      displayLarge: dl.sys.typography.displayLarge,
      displayMedium: dl.sys.typography.displayMedium,
      displaySmall: dl.sys.typography.displaySmall,
      headlineLarge: dl.sys.typography.headingLarge,
      headlineMedium: dl.sys.typography.headingMedium,
      headlineSmall: dl.sys.typography.headingSmall,
      titleLarge: dl.sys.typography.titleLarge,
      titleMedium: dl.sys.typography.titleMedium,
      titleSmall: dl.sys.typography.titleSmall,
      labelLarge: dl.sys.typography.labelLarge,
      labelMedium: dl.sys.typography.labelMedium,
      labelSmall: dl.sys.typography.labelSmall,
      bodyLarge: dl.sys.typography.bodyLarge,
      bodyMedium: dl.sys.typography.bodyMedium,
      bodySmall: dl.sys.typography.bodySmall,
    );
  }

  static Color get red => Colors.red.harmonizeWith(dl.sys.color.tertiary);

  static Color get yellow =>
      Colors.amber.harmonizeWith(AppTheme.dl.sys.color.tertiary);

  static Color get green =>
      Colors.green.harmonizeWith(AppTheme.dl.sys.color.tertiary);

  static Color get blue =>
      Colors.cyan.harmonizeWith(AppTheme.dl.sys.color.tertiary);
}
