import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameIconCard extends StatelessWidget {
  final String gameId;
  final String imageUrl;

  const GameIconCard({
    super.key,
    required this.gameId,
    required this.imageUrl,
  });

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
      child: Ink.image(
        height: 100,
        width: 100,
        image: CachedNetworkImageProvider(imageUrl),
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, '/game/$gameId');
          },
        ),
      ),
    );
  }
}
