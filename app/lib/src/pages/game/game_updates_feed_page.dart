import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/screens/game/updates_feed/game_updates_feed_screen.dart';

@RoutePage()
class GameUpdatesFeedPage extends StatelessWidget {
  const GameUpdatesFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameUpdatesFeedScreen();
  }
}
