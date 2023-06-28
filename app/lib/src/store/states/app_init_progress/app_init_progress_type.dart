import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_init_progress_type.freezed.dart';

@freezed
class AppInitProgress with _$AppInitProgress {
  const AppInitProgress._();

  const factory AppInitProgress({
    @Default(ThemeLoadingStep.init) ThemeLoadingStep themeLoadingStep,
    @Default(NetworkLoadingStep.init) NetworkLoadingStep networkLoadingStep,
    @Default(0) int firebaseLoadingProgress,
  }) = _AppInitProgress;
}

enum ThemeLoadingStep {
  init,
  themeMode,
  appTheme,
  complete,
}

enum NetworkLoadingStep {
  init,
  networkState,
  networkStateListener,
  complete,
}
