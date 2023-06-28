import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/pages/game/game_dashboard_page.dart';
import 'package:tyrion/src/utils/router/app_router.dart';

class AppSegment {
  static List<String> get segmentsList =>
      AppSegments.values.map((e) => e.name).toList();

  static List<AppSegments> get appSegmentsList => AppSegments.values;

  static Map<String, AppSegments> get segmentsMap => Map.fromIterables(
      AppSegments.values.map((e) => e.name), AppSegments.values);

  static Widget? getWidget(AppSegments segment) {
    switch (segment) {
      case AppSegments.games:
        return GameDashboardPage();
      case AppSegments.stocks:
        throw UnimplementedError();
      case AppSegments.schedule:
        throw UnimplementedError();
      default:
        return null;
    }
  }

  static PageRouteInfo<dynamic>? getPageRouteInfo(AppSegments segment) {
    switch (segment) {
      case AppSegments.games:
        return GameDashboardRoute();
      case AppSegments.stocks:
        throw UnimplementedError();
      case AppSegments.schedule:
        throw UnimplementedError();
      default:
        return null;
    }
  }

  static NavigationDestination? getNavigationDestination(AppSegments segment) {
    switch (segment) {
      case AppSegments.games:
        return NavigationDestination(
          icon: Icon(Icons.sports_esports_outlined),
          selectedIcon: Icon(Icons.sports_esports_rounded),
          label: 'Games',
        );
      case AppSegments.stocks:
        return NavigationDestination(
          icon: Icon(Icons.candlestick_chart_outlined),
          selectedIcon: Icon(Icons.candlestick_chart_rounded),
          label: 'Stocks',
        );
      case AppSegments.schedule:
        return NavigationDestination(
          icon: Icon(Icons.schedule_outlined),
          selectedIcon: Icon(Icons.schedule_rounded),
          label: 'Schedule',
        );
      default:
        return null;
    }
  }
}

enum AppSegments {
  games,
  stocks,
  schedule,
}
