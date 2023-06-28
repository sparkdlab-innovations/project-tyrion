import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tyrion/src/store/constants/assets.dart';
import 'package:tyrion/src/ui/screens/splash/compact_splash_screen.dart';
import 'package:video_player/video_player.dart';

class LaunchScreen extends HookWidget {
  final VideoPlayerController controller =
      VideoPlayerController.asset(AppAssets.launchVideo)
        ..setLooping(false)
        ..setVolume(0);

  LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IsMounted isMounted = useIsMounted();
    final Future<void> isInitialized = controller.initialize();
    useEffect(() {
      if (isMounted()) {
        isInitialized.then((value) => controller.play());
      }
      return null;
    });

    return FutureBuilder(
      future: isInitialized,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.value.size.width,
                height: controller.value.size.height,
                child: VideoPlayer(controller),
              ),
            ),
          );
        } else {
          return CompactSplashScreen();
        }
      },
    );
  }
}
