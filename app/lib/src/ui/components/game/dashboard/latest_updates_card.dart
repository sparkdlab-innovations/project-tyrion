import 'package:flutter/material.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/ui/components/game/dashboard/updated_game_card.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class LatestUpdatesCard extends StatelessWidget {
  final List<int> favouriteValues;
  final List<int> followingValues;

  const LatestUpdatesCard({
    super.key,
    required this.favouriteValues,
    required this.followingValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.dl.sys.dimension.shape.corner.large,
        color: AppTheme.dl.sys.color.surfaceContainerMedium,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.dl.sys.dimension.baseDimension * 6,
        vertical: AppTheme.dl.sys.dimension.baseDimension * 3,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Add button to go to all updates page
          // FUCKE: hello wrld
          Text(
            '${AppStrings.commonWordLatest} ${AppStrings.commonWordUpdates}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: AppTheme.dl.sys.dimension.baseDimension * 2,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: constraints.copyWith(
                    minWidth: constraints.maxWidth,
                    maxWidth: double.infinity,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UpdatedGameCard(),
                      UpdatedGameCard(),
                      UpdatedGameCard(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
