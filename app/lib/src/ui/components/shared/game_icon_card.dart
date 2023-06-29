import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameIconCard extends StatelessWidget {
  final String gameId;
  final String imageUrl;
  final double height;
  final double width;
  final void Function()? onTap;
  final void Function()? onLongPress;

  GameIconCard({
    super.key,
    required this.gameId,
    required this.imageUrl,
    this.height = 120,
    this.width = 120,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
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
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: onTap ??
                () {
                  AutoRouter.of(context).pushNamed('/games/$gameId');
                },
            onLongPress: onLongPress,
          ),
        ),
      ),
    );
  }
}
