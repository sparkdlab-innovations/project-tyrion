import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/screens/game/dashboard/game_dashboard_screen.dart';

@RoutePage(deferredLoading: false)
class GameDashboardPage extends StatelessWidget {
  const GameDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement data fetching with repository
    return GameDashboardScreen();
  }
}
