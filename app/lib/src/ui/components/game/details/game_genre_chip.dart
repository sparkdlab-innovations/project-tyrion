import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameGenreChip extends StatelessWidget {
  final String genre;

  const GameGenreChip({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(genre),
      labelPadding: EdgeInsets.symmetric(
        horizontal: AppTheme.dl.sys.dimension.baseDimension * 2,
        vertical: 0,
      ),
      labelStyle: AppTheme.dl.sys.typography.labelLarge,
      backgroundColor: AppTheme.dl.sys.color.tertiaryContainer,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppTheme.dl.sys.dimension.baseDimension * 5,
        ),
      ),
      side: BorderSide.none,
    );
  }
}
