import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GamePrimaryInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? description;

  const GamePrimaryInfoCard({
    super.key,
    required this.icon,
    required this.label,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.dl.sys.color.tertiaryContainer,
      elevation: 3,
      margin: EdgeInsets.only(
        right: AppTheme.dl.sys.dimension.baseDimension * 2,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.dl.sys.dimension.baseDimension * 3,
          vertical: AppTheme.dl.sys.dimension.baseDimension * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppTheme.dl.sys.color.onTertiaryContainer,
            ),
            SizedBox(
              height: AppTheme.dl.sys.dimension.baseDimension * 2,
            ),
            Text(
              label,
              style: AppTheme.dl.sys.typography.bodyLarge.copyWith(
                color: AppTheme.dl.sys.color.onTertiaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (description != null) ...[
              SizedBox(
                height: AppTheme.dl.sys.dimension.baseDimension * 2,
              ),
              Text(
                description!,
                style: AppTheme.dl.sys.typography.bodyMedium.copyWith(
                  color: AppTheme.dl.sys.color.onTertiaryContainer,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
