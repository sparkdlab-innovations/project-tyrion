import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class UpdatedGameCard extends StatelessWidget {
  const UpdatedGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppTheme.dl.sys.color.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppTheme.dl.sys.dimension.baseDimension * 2,
        vertical: AppTheme.dl.sys.dimension.baseDimension * 2,
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 100,
        width: 100,
        child: CachedNetworkImage(
          imageUrl:
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
