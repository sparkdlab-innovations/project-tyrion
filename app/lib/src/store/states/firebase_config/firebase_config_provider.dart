import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tyrion/src/store/states/firebase_config/firebase_config_type.dart';

import '../../../../firebase_options.dart';

part 'firebase_config_provider.g.dart';

@riverpod
class FirebaseConfigState extends _$FirebaseConfigState {
  // TODO: refactor into seperate functions for each product and call them in the build function
  @override
  FutureOr<FirebaseConfig> build() async {
    FirebaseApp firebaseApp = await _initializeFirebaseApp();

    _initializeLibraries(firebaseApp);

    return FirebaseConfig(
      firebaseApp: firebaseApp,
    );
  }

  Future<FirebaseApp> _initializeFirebaseApp() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await Future.wait([
      firebaseApp.setAutomaticDataCollectionEnabled(true),
      firebaseApp.setAutomaticResourceManagementEnabled(true),
    ]);

    return firebaseApp;
  }

  Future<FirebaseFirestore> _initializeFirestore(
      FirebaseApp firebaseApp) async {
    FirebaseFirestore firebaseFirestore =
        FirebaseFirestore.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      firebaseFirestore.useFirestoreEmulator('localhost', 8080);
    }

    firebaseFirestore.settings = Settings(
      cacheSizeBytes: 100,
      sslEnabled: true,
      ignoreUndefinedProperties: true,
      persistenceEnabled: true,
    );
    if (kIsWeb) {
      await firebaseFirestore
          .enablePersistence(PersistenceSettings(synchronizeTabs: true));
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseFirestore: firebaseFirestore);
    });

    return firebaseFirestore;
  }

  Future<FirebaseFunctions> _initializeFunctions(
      FirebaseApp firebaseApp) async {
    FirebaseFunctions firebaseFunctions =
        FirebaseFunctions.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      firebaseFunctions.useFunctionsEmulator('localhost', 5001);
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseFunctions: firebaseFunctions);
    });

    return firebaseFunctions;
  }

  Future<FirebaseAnalytics> _initializeAnalytics(
      FirebaseApp firebaseApp) async {
    FirebaseAnalytics firebaseAnalytics =
        FirebaseAnalytics.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      await firebaseAnalytics.setAnalyticsCollectionEnabled(false);
    } else {
      await firebaseAnalytics.setAnalyticsCollectionEnabled(true);
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseAnalytics: firebaseAnalytics);
    });

    return firebaseAnalytics;
  }

  Future<FirebaseAppCheck> _initializeAppCheck(FirebaseApp firebaseApp) async {
    FirebaseAppCheck firebaseAppCheck =
        FirebaseAppCheck.instanceFor(app: firebaseApp);

    await firebaseAppCheck.setTokenAutoRefreshEnabled(true);

    // TODO: configure apple provider
    await firebaseAppCheck.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.debug,
      webRecaptchaSiteKey: '6LeXQXIiAAAAAOZG9c1rHjCT3WhglKM4_GRKDeJM',
    );

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseAppCheck: firebaseAppCheck);
    });

    return firebaseAppCheck;
  }

  Future<FirebaseInstallations> _initializeInstallations(
      FirebaseApp firebaseApp) async {
    FirebaseInstallations firebaseInstallations =
        FirebaseInstallations.instanceFor(app: firebaseApp);

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        firebaseInstallations: firebaseInstallations,
      );
    });

    return firebaseInstallations;
  }

  Future<FirebaseAuth> _initializeAuth(FirebaseApp firebaseApp) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      await firebaseAuth.useAuthEmulator('localhost', 9099);
      await firebaseAuth.setSettings(
        appVerificationDisabledForTesting: true,
        phoneNumber: '+917077700564',
        smsCode: '123456',
      );
    } else {
      await firebaseAuth.setSettings(
        appVerificationDisabledForTesting: false,
        forceRecaptchaFlow: false,
      );
    }

    if (kIsWeb) {
      await firebaseAuth.setPersistence(Persistence.LOCAL);
    }
    await firebaseAuth.setLanguageCode('en-IN');

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseAuth: firebaseAuth);
    });

    return firebaseAuth;
  }

  Future<FirebaseCrashlytics> _initializeCrashlytics() async {
    FirebaseCrashlytics firebaseCrashlytics = FirebaseCrashlytics.instance;

    if (kDebugMode) {
      await firebaseCrashlytics.setCrashlyticsCollectionEnabled(false);
    } else {
      await firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = firebaseCrashlytics.recordFlutterFatalError;
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseCrashlytics: firebaseCrashlytics);
    });

    return firebaseCrashlytics;
  }

  Future<FirebaseMessaging> _initializeMessaging() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseMessaging: firebaseMessaging);
    });

    return firebaseMessaging;
  }

  Future<FirebasePerformance> _initializePerformance(
      FirebaseApp firebaseApp) async {
    FirebasePerformance firebasePerformance =
        FirebasePerformance.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      await firebasePerformance.setPerformanceCollectionEnabled(false);
    } else {
      await firebasePerformance.setPerformanceCollectionEnabled(true);
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebasePerformance: firebasePerformance);
    });

    return firebasePerformance;
  }

  Future<FirebaseRemoteConfig> _initializeRemoteConfig(
      FirebaseApp firebaseApp) async {
    FirebaseRemoteConfig firebaseRemoteConfig =
        FirebaseRemoteConfig.instanceFor(app: firebaseApp);

    if (kDebugMode) {
      await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ));
    } else {
      await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));
    }

    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(firebaseRemoteConfig: firebaseRemoteConfig);
    });

    return firebaseRemoteConfig;
  }

  Future<void> _initializeLibraries(FirebaseApp firebaseApp) async {
    await _initializeAuth(firebaseApp);

    var future1 = _initializeCrashlytics()
        .then((_) => _initializePerformance(firebaseApp))
        .then((_) => _initializeAnalytics(firebaseApp))
        .then((_) => _initializeInstallations(firebaseApp));
    var future2 = _initializeAppCheck(firebaseApp)
        .then((_) => _initializeFirestore(firebaseApp))
        .then((_) => _initializeFunctions(firebaseApp))
        .then((_) => Future.wait([
              _initializeMessaging(),
              _initializeRemoteConfig(firebaseApp),
            ]));

    await Future.wait([future1, future2]);
    return;
  }
}
