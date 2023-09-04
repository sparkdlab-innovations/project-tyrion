import 'package:tyrion/src/utils/theme/theme.dart';

abstract class AppAssets {
  static String get logo =>
      'assets/images/logo/${AppTheme.isDark ? 'dark' : 'light'}/logo.svg';
  static String get logoTransparent =>
      'assets/images/logo/${AppTheme.isDark ? 'dark' : 'light'}/logo-transparent.svg';

  static String get errorRobot => 'assets/images/error/error-robot.svg';

  static String get launchVideo =>
      'assets/videos/launch_animations/${AppTheme.isDark ? 'dark' : 'light'}.mp4';

  static String get tabletCheckRobot =>
      'assets/images/illustrations/tablet_check.png';
}
