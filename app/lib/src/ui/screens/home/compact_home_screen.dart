import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/shared/landing_navigation_bar.dart';

class CompactHomeScreen extends StatelessWidget {
  final Widget child;
  final TabsRouter tabsRouter;
  final List<NavigationDestination> customDesintations;

  CompactHomeScreen({
    super.key,
    required this.child,
    required this.tabsRouter,
    this.customDesintations = const [],
  }) {
    assert(
      customDesintations.length <= 2,
      'The number of custom destinations must be less than two (2).',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: LandingNavigationBar(
        tabsTouter: tabsRouter,
        customDestinations: customDesintations,
      ),
    );
  }
}
