import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tyrion/src/store/constants/assets.dart';

class CompactSplashScreen extends StatelessWidget {
  const CompactSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: SvgPicture.asset(
            AppAssets.logo,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
