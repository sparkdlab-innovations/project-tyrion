import 'package:flutter/material.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/ui/components/game/dashboard/game_updates_overview_card.dart';
import 'package:tyrion/src/ui/components/game/dashboard/latest_game_updates_card.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameDashboardScreen extends StatelessWidget {
  const GameDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          centerTitle: true,
          title: Text(
            AppStrings.gameDashboardTitle,
          ),
        ),
        SliverPadding(
          padding: AppTheme.dl.sys.dimension.space.edge,
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameUpdatesOverviewCard(
                  favouriteMajorUpdates: 1,
                  favouriteMinorUpdates: 2,
                  favouriteNoUpdates: 3,
                  followingMajorUpdates: 1,
                  followingMinorUpdates: 2,
                  followingNoUpdates: 3,
                ),
                SizedBox(
                  height: AppTheme.dl.sys.dimension.baseDimension * 4,
                ),
                LatestGameUpdatesCard(),
                SizedBox(
                  height: AppTheme.dl.sys.dimension.baseDimension * 4,
                ),
                // TODO: Recommended - show top 3
                // TODO: Favourites - show top 3 based on personal ranking or pinned
                // TODO: Following - show top 3 based on most recently updated
              ],
            ),
          ),
        ),
      ],
    );
  }
}
