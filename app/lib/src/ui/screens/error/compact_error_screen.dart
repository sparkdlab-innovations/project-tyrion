import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyrion/src/store/constants/assets.dart';
import 'package:tyrion/src/store/constants/strings.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class CompactErrorScreen extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;

  const CompactErrorScreen({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(error);
      print(stackTrace);
    }
    return Scaffold(
        body: Padding(
      padding: AppTheme.dl.sys.dimension.space.edge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.appName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            AppStrings.appDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: AppTheme.dl.sys.dimension.baseDimension * 5),
          SizedBox.square(
            dimension: AppTheme.dl.sys.dimension.baseDimension * 50,
            child: SvgPicture.asset(
              AppAssets.errorRobot,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.surface,
                BlendMode.hue,
              ),
            ),
          ),
          SizedBox(height: AppTheme.dl.sys.dimension.baseDimension * 10),
          Text(
            AppStrings.error,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ));
  }
}
