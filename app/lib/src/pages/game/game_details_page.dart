import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/screens/game/details/game_details_screen.dart';

@RoutePage(deferredLoading: false)
class GameDetailsPage extends StatelessWidget {
  final String gameId;

  const GameDetailsPage({
    super.key,
    @PathParam('gameId') required this.gameId,
  });

  @override
  Widget build(BuildContext context) {
    return GameDetailsScreen(
      genres: [],
    );
  }
}
