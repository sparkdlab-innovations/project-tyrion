import 'package:material_color_utilities/material_color_utilities.dart' as mcu;

abstract class PaletteDesignSystem {
  mcu.TonalPalette get primary;
  mcu.TonalPalette get secondary;
  mcu.TonalPalette get tertiary;
  mcu.TonalPalette get neutral;
  mcu.TonalPalette get neutralVariant;
  mcu.TonalPalette get error;
}
