import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tyrion/src/ui/components/game/details/game_details_basic_info.dart';
import 'package:tyrion/src/ui/components/game/details/game_details_header.dart';

class GameDetailsScreen extends HookWidget {
  final List<String> genres;

  GameDetailsScreen({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    /**
     * TODO: Create a layout for the game details screen
     * - Display cover image
     * - Add material carousel for gallery
     * - Description
     *
     * - Primary KPIs
     *  - Status (if not in progress, i.e. abandoned, completed, on hold, etc.)
     *  - Version (additional alert if update available)
     *  - Release Date + Thread Updated Date
     *  - Genre
     *
     * - Secondary KPIs
     *  - Developer
     *  - Personal Rating + Comments
     *
     * - Teritiary KPIs
     *  - Engine
     *  - Tags
     *  - OS
     *
     * - Show links for downloads
     * - Show collapisable section for changelog,
     *    developer notes and download section text (if any)
     * - Add a button to open the game's thread in the browser
     */

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            centerTitle: true,
            title: Text(
              'Some Game Name',
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameDetailsHeader(),
                GameDetailsBasicInfo(genres: genres),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
