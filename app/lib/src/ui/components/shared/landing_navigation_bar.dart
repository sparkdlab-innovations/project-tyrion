import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LandingNavigationBar extends StatelessWidget {
  final TabsRouter tabsTouter;
  final List<NavigationDestination> customDestinations;

  const LandingNavigationBar({
    super.key,
    required this.tabsTouter,
    this.customDestinations = const [],
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: tabsTouter.activeIndex,
      onDestinationSelected: tabsTouter.setActiveIndex,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        ...customDestinations,
        NavigationDestination(
          icon: Icon(Icons.workspaces_outline),
          selectedIcon: Icon(Icons.workspaces_filled),
          label: 'More',
        ),
      ],
    );
  }
}
