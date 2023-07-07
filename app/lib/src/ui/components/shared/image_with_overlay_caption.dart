import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class ImageWithOverlayCaption extends StatelessWidget {
  const ImageWithOverlayCaption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.dl.sys.dimension.shape.corner.medium,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://ik.imagekit.io/tyrion/games/94140/cover.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppTheme.dl.sys.dimension.baseDimension * 4,
              vertical: AppTheme.dl.sys.dimension.baseDimension * 2,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
            child: Text(
              '\n' 'Some Game',
              style: AppTheme.dl.sys.typography.titleLarge.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
