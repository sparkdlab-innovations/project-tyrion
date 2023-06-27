import 'dart:ui';

import 'package:design_language/src/reference/palette/palette_design_system.dart';
import 'package:material_color_utilities/material_color_utilities.dart' as mcu;

class Palette implements PaletteDesignSystem {
  final mcu.TonalPalette _primary;
  final mcu.TonalPalette _secondary;
  final mcu.TonalPalette _tertiary;
  final mcu.TonalPalette _neutral;
  final mcu.TonalPalette _neutralVariant;
  final mcu.TonalPalette _error;

  Palette({
    Color? primary = const Color(0xff6750a4),
    Color? secondary = const Color(0xff625b71),
    Color? tertiary = const Color(0xff7d5260),
    Color? neutral = const Color(0xff605d62),
    Color? neutralVariant = const Color(0xff605d66),
    Color? error = const Color(0xffb3261e),
  })  : _primary = mcu.TonalPalette.of(mcu.Hct.fromInt(primary!.value).hue,
            mcu.Hct.fromInt(primary.value).chroma),
        _secondary = mcu.TonalPalette.of(mcu.Hct.fromInt(secondary!.value).hue,
            mcu.Hct.fromInt(secondary.value).chroma),
        _tertiary = mcu.TonalPalette.of(mcu.Hct.fromInt(tertiary!.value).hue,
            mcu.Hct.fromInt(tertiary.value).chroma),
        _neutral = mcu.TonalPalette.of(mcu.Hct.fromInt(neutral!.value).hue,
            mcu.Hct.fromInt(neutral.value).chroma),
        _neutralVariant = mcu.TonalPalette.of(
            mcu.Hct.fromInt(neutralVariant!.value).hue,
            mcu.Hct.fromInt(neutralVariant.value).chroma),
        _error = mcu.TonalPalette.of(mcu.Hct.fromInt(error!.value).hue,
            mcu.Hct.fromInt(error.value).chroma);

  @override
  mcu.TonalPalette get primary => _primary;

  @override
  mcu.TonalPalette get secondary => _secondary;

  @override
  mcu.TonalPalette get tertiary => _tertiary;

  @override
  mcu.TonalPalette get neutral => _neutral;

  @override
  mcu.TonalPalette get neutralVariant => _neutralVariant;

  @override
  mcu.TonalPalette get error => _error;
}
