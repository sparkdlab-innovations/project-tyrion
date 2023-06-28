import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:design_language/design_language.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyrion/src/store/states/app_config/app_config_type.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

part 'app_config_provider.g.dart';

@riverpod
class AppConfigState extends _$AppConfigState {
  @override
  FutureOr<AppConfig> build() async {
    GoogleFonts.config.allowRuntimeFetching = false;

    _initThemeMode().then((themeMode) => _initAppTheme(themeMode));

    _initNetworkState().then((networkState) => _initNetworkStateListener());

    if (kDebugMode) {
      // await Future.delayed(Duration(milliseconds: 5000), () => {});
      // throw Exception('Test error');
    }

    return AppConfig();
  }

  Future<ThemeMode> _initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? themeModeString = prefs.getString('preffered_app_theme_mode');

    ThemeMode themeMode;
    switch (themeModeString) {
      case 'light':
        themeMode = ThemeMode.light;
      case 'dark':
        themeMode = ThemeMode.dark;
      default:
        themeMode = ThemeMode.system;
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        themeMode: themeMode,
      );
    });

    return themeMode;
  }

  Future<DesignLanguage> _initAppTheme(ThemeMode? themeMode) async {
    CorePalette? corePalette = await DynamicColorPlugin.getCorePalette();

    themeMode ??= state.value!.themeMode;

    if (themeMode == ThemeMode.system) {
      themeMode =
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                  Brightness.light
              ? ThemeMode.light
              : ThemeMode.dark;
    }

    if (kDebugMode) {
      await Future.delayed(Duration(milliseconds: 2000), () => {});
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        usingDynamicTheme: true,
      );
    });

    return AppTheme.init(
      isDark: themeMode == ThemeMode.dark,
      corePalete: corePalette,
    );
  }

  NetworkState _parseNetworkState(ConnectivityResult connectivityResult) {
    if ([
      ConnectivityResult.mobile,
      ConnectivityResult.wifi,
      ConnectivityResult.ethernet
    ].contains(connectivityResult)) {
      return NetworkState.online;
    } else if (connectivityResult == ConnectivityResult.none) {
      return NetworkState.offline;
    } else {
      return NetworkState.unknown;
    }
  }

  Future<NetworkState> _initNetworkState() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        networkState: _parseNetworkState(connectivityResult),
      );
    });

    return _parseNetworkState(connectivityResult);
  }

  Future<StreamSubscription<ConnectivityResult>>
      _initNetworkStateListener() async {
    StreamSubscription<ConnectivityResult> connectivitySubscription =
        Connectivity()
            .onConnectivityChanged
            .listen((ConnectivityResult result) async {
      state = await AsyncValue.guard(() async {
        return state.value!.copyWith(
          networkState: _parseNetworkState(result),
        );
      });
    });

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        cancelNetworkListener: connectivitySubscription.cancel,
      );
    });

    return connectivitySubscription;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'preffered_app_theme_mode',
      themeMode.name,
    );

    if (themeMode == ThemeMode.dark) {
      AppTheme.init(isDark: true);
    } else if (themeMode == ThemeMode.light) {
      AppTheme.init(isDark: false);
    } else if (themeMode == ThemeMode.system &&
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light) {
      AppTheme.init(isDark: false);
    } else {
      AppTheme.init(isDark: true);
    }

    state = await AsyncValue.guard(() async {
      if (state.hasValue) {
        return state.value!.copyWith(
          themeMode: themeMode,
        );
      } else {
        return Future.value(state.value);
      }
    });
  }
}
