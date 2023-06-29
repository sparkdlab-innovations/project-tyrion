import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/game/details/game_primary_info_card.dart';
import 'package:tyrion/src/ui/components/shared/image_hero.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameDetailsHeader extends StatelessWidget {
  const GameDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppTheme.dl.sys.dimension.space.edge.copyWith(
            bottom: AppTheme.dl.sys.dimension.baseDimension * 4,
          ),
          child: ImageHero(
            imageUrl: 'https://ik.imagekit.io/tyrion/games/94140/cover.jpg',
          ),
        ),
        Card(
          // color: AppTheme.dl.sys.color.errorContainer,
          color: AppTheme.green,
          elevation: 3,
          margin: AppTheme.dl.sys.dimension.space.edge.copyWith(
            bottom: AppTheme.dl.sys.dimension.baseDimension * 2,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.dl.sys.dimension.baseDimension * 3,
              vertical: AppTheme.dl.sys.dimension.baseDimension * 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_rounded,
                  color: AppTheme.dl.sys.color.onErrorContainer,
                ),
                SizedBox(
                  width: AppTheme.dl.sys.dimension.baseDimension * 2,
                ),
                Text(
                  'Completed',
                  style: AppTheme.dl.sys.typography.bodyLarge.copyWith(
                    color: AppTheme.dl.sys.color.onErrorContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: AppTheme.dl.sys.dimension.baseDimension * 2,
            bottom: AppTheme.dl.sys.dimension.baseDimension * 6,
          ),
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: AppTheme.dl.sys.dimension.space.edge.right,
                ),
                GamePrimaryInfoCard(
                  icon: Icons.build_circle,
                  label: 'Latest Version',
                  description: 'v0.33',
                ),
                GamePrimaryInfoCard(
                  icon: Icons.new_releases_rounded,
                  label: 'Release Date',
                  description: '2023-06-14',
                ),
                GamePrimaryInfoCard(
                  icon: Icons.update_rounded,
                  label: 'Thread Updated',
                  description: '2023-06-23',
                ),
                GamePrimaryInfoCard(
                  icon: Icons.download_for_offline_rounded,
                  label: 'Last Downloded',
                  description: 'v0.33\n2023-06-28',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
