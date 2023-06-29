import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class ImageCarouselGallery extends StatelessWidget {
  final List<String> imageUrls;

  const ImageCarouselGallery({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableCarousel.builder(
      options: CarouselOptions(
        autoPlay: false,
        // autoPlayInterval: const Duration(seconds: 3),
        // autoPlayAnimationDuration: const Duration(milliseconds: 800),
        // autoPlayCurve: AppTheme.dl.sys.motion.easing.standard.base,
        enableInfiniteScroll: false,
        showIndicator: false,
        keepPage: true,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppTheme.dl.sys.dimension.baseDimension * 2,
          ),
          decoration: BoxDecoration(
            borderRadius: AppTheme.dl.sys.dimension.shape.corner.extraLarge,
          ),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrls[index],
          ),
        );
      },
    );
  }
}
