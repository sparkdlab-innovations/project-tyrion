import 'package:auto_route/auto_route.dart';
import 'package:design_language/design_language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/store/states/app_config/app_config_provider.dart';
import 'package:tyrion/src/store/states/app_init_progress/app_init_progress_provider.dart';
import 'package:tyrion/src/ui/screens/error/compact_error_screen.dart';
import 'package:tyrion/src/ui/screens/splash/compact_splash_screen.dart';
import 'package:tyrion/src/utils/router/app_router.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class TyrionApp extends ConsumerWidget {
  TyrionApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfigProvider = ref.watch(appConfigStateProvider);
    final appInitProgress = ref.watch(appInitProgressStateProvider);

    if (kDebugMode) {
      print('AppConfig: $appInitProgress');
    }

    return appConfigProvider.when<Widget>(data: (appConfig) {
      if (appInitProgress.isComplete) {
        FlutterNativeSplash.remove();
        return MaterialApp.router(
          title: AppStrings.appName,
          themeMode: appConfig.themeMode,
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
          routerConfig: appRouter.config(
            deepLinkBuilder: (PlatformDeepLink deepLink) {
              return DeepLink.path(deepLink.path);
            },
          ),
        );
      } else {
        return MaterialApp(
          title: AppStrings.appName,
          themeMode:
              appConfigProvider.valueOrNull?.themeMode ?? ThemeMode.system,
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
          initialRoute: '/',
          home: AppTheme.windowClass == WindowClass.medium
              ? throw UnimplementedError()
              : AppTheme.windowClass == WindowClass.expanded
                  ? throw UnimplementedError()
                  : CompactSplashScreen(),
        );
      }
    }, error: (error, stack) {
      FlutterNativeSplash.remove();
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
    }, loading: () {
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
        initialRoute: '/',
        home: AppTheme.windowClass == WindowClass.medium
            ? throw UnimplementedError()
            : AppTheme.windowClass == WindowClass.expanded
                ? throw UnimplementedError()
                : CompactSplashScreen(),
      );
    });
  }
}
