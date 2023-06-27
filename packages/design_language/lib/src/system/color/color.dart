import 'dart:ui' as ui show Color;

import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/system/color/color_design_system.dart';

class Color implements ColorDesignSystem {
  final Reference _ref;
  final bool _isDark;

  Color({
    required Reference ref,
    required bool isDark,
  })  : _ref = ref,
        _isDark = isDark;

  @override
  ui.Color get primary => !_isDark
      ? ui.Color(_ref.palette.primary.get(40))
      : ui.Color(_ref.palette.primary.get(80));
  @override
  ui.Color get primaryContainer => !_isDark
      ? ui.Color(_ref.palette.primary.get(90))
      : ui.Color(_ref.palette.primary.get(30));
  @override
  ui.Color get onPrimary => !_isDark
      ? ui.Color(_ref.palette.primary.get(100))
      : ui.Color(_ref.palette.primary.get(20));
  @override
  ui.Color get onPrimaryContainer => !_isDark
      ? ui.Color(_ref.palette.primary.get(10))
      : ui.Color(_ref.palette.primary.get(90));
  @override
  ui.Color get inversePrimary => !_isDark
      ? ui.Color(_ref.palette.primary.get(80))
      : ui.Color(_ref.palette.primary.get(40));

  @override
  ui.Color get secondary => !_isDark
      ? ui.Color(_ref.palette.secondary.get(40))
      : ui.Color(_ref.palette.secondary.get(80));
  @override
  ui.Color get secondaryContainer => !_isDark
      ? ui.Color(_ref.palette.secondary.get(90))
      : ui.Color(_ref.palette.secondary.get(30));
  @override
  ui.Color get onSecondary => !_isDark
      ? ui.Color(_ref.palette.secondary.get(100))
      : ui.Color(_ref.palette.secondary.get(20));
  @override
  ui.Color get onSecondaryContainer => !_isDark
      ? ui.Color(_ref.palette.secondary.get(10))
      : ui.Color(_ref.palette.secondary.get(90));

  @override
  ui.Color get tertiary => !_isDark
      ? ui.Color(_ref.palette.tertiary.get(40))
      : ui.Color(_ref.palette.tertiary.get(80));
  @override
  ui.Color get tertiaryContainer => !_isDark
      ? ui.Color(_ref.palette.tertiary.get(90))
      : ui.Color(_ref.palette.tertiary.get(30));
  @override
  ui.Color get onTertiary => !_isDark
      ? ui.Color(_ref.palette.tertiary.get(100))
      : ui.Color(_ref.palette.tertiary.get(20));
  @override
  ui.Color get onTertiaryContainer => !_isDark
      ? ui.Color(_ref.palette.tertiary.get(10))
      : ui.Color(_ref.palette.tertiary.get(90));

  @override
  ui.Color get surface => ui.Color(
      !_isDark ? _ref.palette.neutral.get(98) : _ref.palette.neutral.get(6));
  @override
  ui.Color get surfaceDim => ui.Color(
      !_isDark ? _ref.palette.neutral.get(87) : _ref.palette.neutral.get(6));
  @override
  ui.Color get surfaceLight => ui.Color(
      !_isDark ? _ref.palette.neutral.get(98) : _ref.palette.neutral.get(24));

  @override
  ui.Color get surfaceContainerLowest => ui.Color(
      !_isDark ? _ref.palette.neutral.get(100) : _ref.palette.neutral.get(4));
  @override
  ui.Color get surfaceContainerLow => ui.Color(
      !_isDark ? _ref.palette.neutral.get(96) : _ref.palette.neutral.get(10));
  @override
  ui.Color get surfaceContainerMedium => ui.Color(
      !_isDark ? _ref.palette.neutral.get(94) : _ref.palette.neutral.get(12));
  @override
  ui.Color get surfaceContainerHigh => ui.Color(
      !_isDark ? _ref.palette.neutral.get(92) : _ref.palette.neutral.get(17));
  @override
  ui.Color get surfaceContainerHighest => ui.Color(
      !_isDark ? _ref.palette.neutral.get(90) : _ref.palette.neutral.get(22));

  @override
  ui.Color get surfaceVariant => ui.Color(
      !_isDark ? _ref.palette.neutral.get(90) : _ref.palette.neutral.get(30));
  @override
  ui.Color get onSurface => ui.Color(
      !_isDark ? _ref.palette.neutral.get(10) : _ref.palette.neutral.get(90));
  @override
  ui.Color get onSurfaceVariant => ui.Color(
      !_isDark ? _ref.palette.neutral.get(30) : _ref.palette.neutral.get(80));

  @override
  ui.Color get inverseSurface => ui.Color(
      !_isDark ? _ref.palette.neutral.get(20) : _ref.palette.neutral.get(90));
  @override
  ui.Color get inverseOnSurface => ui.Color(
      !_isDark ? _ref.palette.neutral.get(95) : _ref.palette.neutral.get(20));

  @override
  ui.Color get background => ui.Color(
      !_isDark ? _ref.palette.neutral.get(98) : _ref.palette.neutral.get(6));
  @override
  ui.Color get onBackground => ui.Color(
      !_isDark ? _ref.palette.neutral.get(10) : _ref.palette.neutral.get(90));

  @override
  ui.Color get error => !_isDark
      ? ui.Color(_ref.palette.error.get(40))
      : ui.Color(_ref.palette.error.get(80));
  @override
  ui.Color get errorContainer => !_isDark
      ? ui.Color(_ref.palette.error.get(90))
      : ui.Color(_ref.palette.error.get(30));
  @override
  ui.Color get onError => !_isDark
      ? ui.Color(_ref.palette.error.get(100))
      : ui.Color(_ref.palette.error.get(20));
  @override
  ui.Color get onErrorContainer => !_isDark
      ? ui.Color(_ref.palette.error.get(10))
      : ui.Color(_ref.palette.error.get(90));

  @override
  ui.Color get outline => !_isDark
      ? ui.Color(_ref.palette.neutralVariant.get(50))
      : ui.Color(_ref.palette.neutralVariant.get(60));
  @override
  ui.Color get outlineVariant => !_isDark
      ? ui.Color(_ref.palette.neutralVariant.get(80))
      : ui.Color(_ref.palette.neutralVariant.get(30));

  @override
  ui.Color get shadow => !_isDark
      ? ui.Color(_ref.palette.neutral.get(0))
      : ui.Color(_ref.palette.neutral.get(0));

  @override
  ui.Color get surfaceTint => primary;

  @override
  ui.Color get scrim => !_isDark
      ? ui.Color(_ref.palette.neutral.get(0))
      : ui.Color(_ref.palette.neutral.get(0));
}
