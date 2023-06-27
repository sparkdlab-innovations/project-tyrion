import 'package:design_language/src/reference/reference_design_systems.dart';
import 'package:design_language/src/system/system_design_systems.dart';

export 'package:design_language/src/reference/reference_design_systems.dart';
export 'package:design_language/src/system/system_design_systems.dart';

abstract class DesignLanguageDesignSystem {
  bool get isDark;

  ReferenceDesignSystem get ref;

  SystemDesignSystem get sys;
}
