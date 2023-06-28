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
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_config_type.freezed.dart';

@freezed
class FirebaseConfig with _$FirebaseConfig {
  const factory FirebaseConfig({
    FirebaseApp? firebaseApp,
    FirebaseFirestore? firebaseFirestore,
    FirebaseFunctions? firebaseFunctions,
    FirebaseAnalytics? firebaseAnalytics,
    FirebaseAppCheck? firebaseAppCheck,
    FirebaseInstallations? firebaseInstallations,
    FirebaseAuth? firebaseAuth,
    FirebaseCrashlytics? firebaseCrashlytics,
    FirebaseMessaging? firebaseMessaging,
    FirebasePerformance? firebasePerformance,
    FirebaseRemoteConfig? firebaseRemoteConfig,
  }) = _FirebaseConfig;
}
