import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tyrion/src/store/states/app_config/app_config_provider.dart';
import 'package:tyrion/src/store/states/app_config/app_config_type.dart';
import 'package:tyrion/src/store/states/app_init_progress/app_init_progress_type.dart';
import 'package:tyrion/src/store/states/firebase_config/firebase_config_provider.dart';
import 'package:tyrion/src/store/states/firebase_config/firebase_config_type.dart';

part 'app_init_progress_provider.g.dart';

@riverpod
AppInitProgress appInitProgressState(AppInitProgressStateRef ref) {
  AsyncValue<AppConfig> appConfigProvider = ref.watch(appConfigStateProvider);
  AsyncValue<FirebaseConfig> firebaseConfigProvider =
      ref.watch(firebaseConfigStateProvider);

  ThemeLoadingStep themeLoadingStep;
  if (appConfigProvider.value?.usingDynamicTheme != null) {
    themeLoadingStep = ThemeLoadingStep.complete;
  } else if (appConfigProvider.value?.themeMode != null) {
    themeLoadingStep = ThemeLoadingStep.appTheme;
  } else {
    themeLoadingStep = ThemeLoadingStep.themeMode;
  }

  NetworkLoadingStep networkLoadingStep;
  if (appConfigProvider.value?.cancelNetworkListener != null) {
    networkLoadingStep = NetworkLoadingStep.complete;
  } else if (appConfigProvider.value?.networkState != null) {
    networkLoadingStep = NetworkLoadingStep.networkStateListener;
  } else {
    networkLoadingStep = NetworkLoadingStep.networkState;
  }

  int firebaseLoadingProgress = 0;
  if (firebaseConfigProvider.value?.firebaseApp != null) {
    firebaseLoadingProgress += 30;
  }
  if (firebaseConfigProvider.value?.firebaseAuth != null) {
    firebaseLoadingProgress += 20;
  }
  if (firebaseConfigProvider.value?.firebaseFirestore != null) {
    firebaseLoadingProgress += 20;
  }
  if (firebaseConfigProvider.value?.firebaseFunctions != null) {
    firebaseLoadingProgress += 18;
  }
  if (firebaseConfigProvider.value?.firebaseAnalytics != null) {
    firebaseLoadingProgress += 15;
  }
  if (firebaseConfigProvider.value?.firebaseAppCheck != null) {
    firebaseLoadingProgress += 12;
  }
  if (firebaseConfigProvider.value?.firebaseMessaging != null) {
    firebaseLoadingProgress += 10;
  }
  if (firebaseConfigProvider.value?.firebaseRemoteConfig != null) {
    firebaseLoadingProgress += 10;
  }
  if (firebaseConfigProvider.value?.firebaseCrashlytics != null) {
    firebaseLoadingProgress += 8;
  }
  if (firebaseConfigProvider.value?.firebasePerformance != null) {
    firebaseLoadingProgress += 5;
  }
  if (firebaseConfigProvider.value?.firebaseInstallations != null) {
    firebaseLoadingProgress += 2;
  }

  return AppInitProgress(
    themeLoadingStep: themeLoadingStep,
    networkLoadingStep: networkLoadingStep,
    firebaseLoadingProgress: (firebaseLoadingProgress / 150 * 100).round(),
  );
}
