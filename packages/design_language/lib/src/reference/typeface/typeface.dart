import 'package:design_language/src/reference/typeface/typeface_design_system.dart';

class Typeface implements TypefaceDesignSystem {
  final String _plainFontFamily;
  final String _brandFontFamily;

  final int _boldFontWeight;
  final int _mediumFontWeight;
  final int _regularFontWeight;

  Typeface({
    String? plainFontFamily = 'Roboto',
    String? brandFontFamily = 'Roboto',
    int? regularFontWeight = 400,
    int? mediumFontWeight = 500,
    int? boldFontWeight = 700,
  })  : _regularFontWeight = regularFontWeight!,
        _mediumFontWeight = mediumFontWeight!,
        _boldFontWeight = boldFontWeight!,
        _brandFontFamily = brandFontFamily!,
        _plainFontFamily = plainFontFamily!;

  @override
  FontFamilyDesignSystem get family => FontFamily(
        plain: _plainFontFamily,
        brand: _brandFontFamily,
      );

  @override
  FontWeightDesignSystem get weight => FontWeight(
        regular: _regularFontWeight,
        medium: _mediumFontWeight,
        bold: _boldFontWeight,
      );
}

class FontFamily implements FontFamilyDesignSystem {
  @override
  final String plain;
  @override
  final String brand;

  FontFamily({
    this.plain = 'Roboto',
    this.brand = 'Roboto',
  });
}

class FontWeight implements FontWeightDesignSystem {
  @override
  final int bold;
  @override
  final int medium;
  @override
  final int regular;

  FontWeight({
    this.regular = 400,
    this.medium = 500,
    this.bold = 700,
  });
}
