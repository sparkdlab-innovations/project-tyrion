import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/ui/components/shared/game_icon_card.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class LatestGameUpdatesCard extends StatelessWidget {
  const LatestGameUpdatesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppTheme.dl.sys.dimension.shape.corner.medium,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.dl.sys.dimension.baseDimension * 6,
          vertical: AppTheme.dl.sys.dimension.baseDimension * 3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.gameDashboardLatestUpdates,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  iconSize: AppTheme.dl.sys.typography.bodyMedium.fontSize,
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppTheme.dl.sys.color.onSurface,
                  ),
                  onPressed: () {
                    AutoRouter.of(context).pushNamed('/games/feed');
                  },
                ),
              ],
            ),
            SizedBox(
              height: AppTheme.dl.sys.dimension.baseDimension * 2,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GameIconCard(
                      gameId: 'gameId',
                      imageUrl:
                          'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
                      height: min(constraints.maxWidth / 3, 120),
                      width: min(constraints.maxWidth / 3, 120),
                    ),
                    GameIconCard(
                      gameId: 'gameId',
                      imageUrl:
                          'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
                      height: min(constraints.maxWidth / 3, 120),
                      width: min(constraints.maxWidth / 3, 120),
                    ),
                    GameIconCard(
                      gameId: 'gameId',
                      imageUrl:
                          'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
                      height: min(constraints.maxWidth / 3, 120),
                      width: min(constraints.maxWidth / 3, 120),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
