import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/game/details/game_genre_chip.dart';
import 'package:tyrion/src/ui/components/shared/image_carousel_gallery.dart';
import 'package:tyrion/src/ui/components/widgets/collapsible_widget.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameDetailsBasicInfo extends StatelessWidget {
  final List<String> genres;

  const GameDetailsBasicInfo({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: AppTheme.dl.sys.dimension.space.edge.copyWith(
            bottom: AppTheme.dl.sys.dimension.baseDimension,
          ),
          child: Text(
            'About the game',
            style: AppTheme.dl.sys.typography.headingSmall,
            textAlign: TextAlign.start,
            softWrap: true,
          ),
        ),
        Padding(
          padding: AppTheme.dl.sys.dimension.space.edge.copyWith(
            bottom: AppTheme.dl.sys.dimension.baseDimension * 4,
          ),
          child: Text(
            'Some Description',
            style: AppTheme.dl.sys.typography.bodyMedium,
            textAlign: TextAlign.justify,
            softWrap: true,
          ),
        ),
        if (genres.isNotEmpty)
          Padding(
            padding: AppTheme.dl.sys.dimension.space.edge,
            child: CollapsibleWidget(
              minHeight: 100,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: AppTheme.dl.sys.dimension.baseDimension * 2,
                children: genres.map((e) => GameGenreChip(genre: e)).toList(),
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppTheme.dl.sys.dimension.baseDimension * 2,
          ),
          child: ImageCarouselGallery(
            imageUrls: [
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg',
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg',
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg?tr=n-medium_thumbnail',
              'https://ik.imagekit.io/tyrion/games/94140/cover.jpg',
            ],
          ),
        ),
      ],
    );
  }
}
