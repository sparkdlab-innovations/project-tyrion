import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/shared/image_with_overlay_caption.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameUpdateFeedCard extends StatelessWidget {
  const GameUpdateFeedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppTheme.dl.sys.dimension.shape.corner.medium,
      ),
      color: AppTheme.dl.sys.color.surface,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageWithOverlayCaption(),
          Padding(
            padding: EdgeInsets.only(
              left: AppTheme.dl.sys.dimension.baseDimension * 4,
              top: AppTheme.dl.sys.dimension.baseDimension * 4,
              bottom: AppTheme.dl.sys.dimension.baseDimension * 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chapter 4',
                  style: AppTheme.dl.sys.typography.headingMedium,
                ),
                SizedBox(
                  height: AppTheme.dl.sys.dimension.baseDimension * 1,
                ),
                Text(
                  '4 hours ago',
                  style: AppTheme.dl.sys.typography.labelMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: AppTheme.dl.sys.dimension.baseDimension * 4,
              bottom: AppTheme.dl.sys.dimension.baseDimension * 4,
              top: AppTheme.dl.sys.dimension.baseDimension * 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.tonal(
                  onPressed: () {},
                  child: Text('Know More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
