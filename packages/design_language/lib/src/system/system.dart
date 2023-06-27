import 'package:design_language/src/reference/reference.dart';
import 'package:design_language/src/system/color/color.dart';
import 'package:design_language/src/system/dimension/dimension.dart';
import 'package:design_language/src/system/motion/motion.dart';
import 'package:design_language/src/system/system_design_systems.dart';
import 'package:design_language/src/system/typography/typography.dart';

class System implements SystemDesignSystem {
  final Reference _ref;

  final bool? _isDark;

  final double? _fontLineHeightScale;
  final double? _fontSizeScale;

  System({
    required Reference ref,
    bool? isDark,
    double? fontLineHeightScale,
    double? fontSizeScale,
  })  : _ref = ref,
        _isDark = isDark,
        _fontSizeScale = fontSizeScale,
        _fontLineHeightScale = fontLineHeightScale;

  @override
  ColorDesignSystem get color => Color(
        ref: _ref,
        isDark: _isDark ?? true,
      );

  @override
  DimensionDesignSystem get dimension => Dimension(
        ref: _ref,
      );

  @override
  MotionDesignSystem get motion => Motion(
        ref: _ref,
      );

  @override
  TypographyDesignSystem get typography => Typography(
        ref: _ref,
        color: color,
        fontLineHeightScale: _fontLineHeightScale ?? 1,
        fontSizeScale: _fontSizeScale ?? 1,
      );
}
