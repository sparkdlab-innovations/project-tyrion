import 'package:design_language/design_language.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/store/states/app_config/app_config_type.dart';
import 'package:tyrion/src/ui/screens/error/compact_error_screen.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.appConfigProvider,
    required this.error,
    required this.stack,
  });

  final AsyncValue<AppConfig> appConfigProvider;
  final Object error;
  final StackTrace stack;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: appConfigProvider.valueOrNull?.themeMode ?? ThemeMode.system,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: AppTheme.lightColorScheme,
        textTheme: AppTheme.lightTextTheme,
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: AppTheme.darkColorScheme,
        textTheme: AppTheme.darkTextTheme,
      ),
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: Duration(milliseconds: 1000),
      initialRoute: '/error',
      home: AppTheme.windowClass == WindowClass.medium
          ? throw UnimplementedError()
          : AppTheme.windowClass == WindowClass.expanded
              ? throw UnimplementedError()
              : CompactErrorScreen(error: error, stackTrace: stack),
    );
  }
}
