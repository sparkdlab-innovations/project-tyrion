import 'dart:ui';

abstract class ColorDesignSystem {
  Color get primary;
  Color get primaryContainer;
  Color get onPrimary;
  Color get onPrimaryContainer;
  Color get inversePrimary;

  Color get secondary;
  Color get secondaryContainer;
  Color get onSecondary;
  Color get onSecondaryContainer;

  Color get tertiary;
  Color get tertiaryContainer;
  Color get onTertiary;
  Color get onTertiaryContainer;

  Color get surface;
  Color get surfaceDim;
  Color get surfaceLight;

  Color get surfaceContainerLowest;
  Color get surfaceContainerLow;
  Color get surfaceContainerMedium;
  Color get surfaceContainerHigh;
  Color get surfaceContainerHighest;

  Color get surfaceVariant;
  Color get onSurface;
  Color get onSurfaceVariant;

  Color get inverseSurface;
  Color get inverseOnSurface;

  Color get background;
  Color get onBackground;

  Color get error;
  Color get errorContainer;
  Color get onError;
  Color get onErrorContainer;

  Color get outline;
  Color get outlineVariant;

  Color get shadow;

  Color get surfaceTint;

  Color get scrim;
}
