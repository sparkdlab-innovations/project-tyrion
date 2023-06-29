import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class ImageHero extends StatelessWidget {
  final String imageUrl;

  const ImageHero({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.dl.sys.dimension.shape.corner.extraLarge,
      ),
      clipBehavior: Clip.antiAlias,
      // TODO: Move photo view to a new full screen view
      // TODO: replace with a basic image widget which opens the full screen view
      child: PhotoView(
        tightMode: true,
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered,
        initialScale: PhotoViewComputedScale.contained,
        basePosition: Alignment.center,
        imageProvider: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
