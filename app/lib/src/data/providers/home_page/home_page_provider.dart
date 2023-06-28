import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyrion/src/data/models/page/home_page/home_page_data.dart';

part 'home_page_provider.g.dart';

@riverpod
Future<HomePageData> homePageData(
  HomePageDataRef ref, {
  required bool skipLaunchVideo,
}) async {
  Stopwatch stopwatch = Stopwatch();

  if (!skipLaunchVideo) {
    stopwatch.start();
  }

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (!skipLaunchVideo) {
    stopwatch.stop();
    await Future.delayed(
        Duration(milliseconds: 7500 - stopwatch.elapsedMilliseconds), () {});
  }

  return HomePageData(
    pinnedSegments:
        sharedPreferences.getStringList('pinned_segments') ?? <String>['games'],
  );
}
