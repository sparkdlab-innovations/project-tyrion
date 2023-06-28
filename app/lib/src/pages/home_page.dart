import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tyrion/src/data/models/page/home_page/home_page_data.dart';
import 'package:tyrion/src/data/models/page/home_page/home_page_provider.dart';
import 'package:tyrion/src/ui/screens/error/compact_error_screen.dart';
import 'package:tyrion/src/ui/screens/home/home_screen.dart';
import 'package:tyrion/src/ui/screens/launch/launch_screen.dart';
import 'package:tyrion/src/ui/screens/splash/compact_splash_screen.dart';

@RoutePage(deferredLoading: false)
class HomePage extends ConsumerWidget {
  final bool skipLaunchVideo;

  HomePage({
    super.key,
    this.skipLaunchVideo = kDebugMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<HomePageData?>(
      future: ref
          .read(homePageDataProvider(skipLaunchVideo: skipLaunchVideo).future),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<HomePageData?> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(
            data: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return CompactErrorScreen(
            error: snapshot.error!,
            stackTrace: snapshot.stackTrace!,
          );
        } else if (!skipLaunchVideo) {
          return LaunchScreen();
        } else {
          return CompactSplashScreen();
        }
      },
    );
  }
}
