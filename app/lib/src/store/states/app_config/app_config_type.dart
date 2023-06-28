import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_type.freezed.dart';

@freezed
class AppConfig with _$AppConfig {
  const AppConfig._();

  const factory AppConfig({
    @Default(ThemeMode.system) ThemeMode themeMode,
    bool? usingDynamicTheme,
    @Default(NetworkState.online) NetworkState networkState,
    Future<void> Function()? cancelNetworkListener,
  }) = _AppConfig;

  Brightness get brightness =>
      themeMode == ThemeMode.light ? Brightness.light : Brightness.dark;
}

enum NetworkState {
  online,
  offline,
  unknown,
}
