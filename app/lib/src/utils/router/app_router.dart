// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:tyrion/src/pages/dashboard_page.dart';
import 'package:tyrion/src/pages/dev_theme_test_page.dart';
import 'package:tyrion/src/pages/game/game_dashboard_page.dart';
import 'package:tyrion/src/pages/game/game_details_page.dart';
import 'package:tyrion/src/pages/game/game_updates_feed_page.dart';
import 'package:tyrion/src/pages/home_page.dart';
import 'package:tyrion/src/pages/more_page.dart';
import 'package:tyrion/src/store/constants/strings.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  // TODO: add route gaurds to check if user is logged in
  // TODO: add route gaurds to check if user has access to segment

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
          fullMatch: true,
          keepHistory: true,
          title: (context, data) {
            return AppStrings.appHomeTitle;
          },
          type: RouteType.material(),
          usesPathAsKey: true,
          children: <AutoRoute>[
            AutoRoute(
              page: DashboardRoute.page,
              path: '',
              initial: true,
              fullMatch: true,
              keepHistory: true,
              title: (context, data) {
                return AppStrings.appHomeTitle;
              },
              type: RouteType.material(),
              usesPathAsKey: true,
            ),
            AutoRoute(
              page: GameDashboardRoute.page,
              path: 'games',
              initial: false,
              fullMatch: true,
              keepHistory: true,
              title: (context, data) {
                return AppStrings.gameDashboardTitle;
              },
              type: RouteType.material(),
              usesPathAsKey: true,
            ),
            AutoRoute(
              page: MoreRoute.page,
              path: 'more',
              initial: false,
              fullMatch: true,
              keepHistory: true,
              title: (context, data) {
                return 'More';
              },
              type: RouteType.material(),
              usesPathAsKey: true,
            )
          ],
        ),
        AutoRoute(
          page: GameUpdatesFeedRoute.page,
          path: '/games/feed',
          initial: false,
          fullMatch: true,
          keepHistory: true,
          title: (context, data) {
            return 'Game Updates Feed';
          },
          type: RouteType.material(),
          usesPathAsKey: true,
        ),
        AutoRoute(
          page: GameDetailsRoute.page,
          path: '/games/:gameId',
          initial: false,
          fullMatch: false,
          keepHistory: true,
          title: (context, data) {
            return 'Details';
          },
          type: RouteType.material(),
          usesPathAsKey: true,
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
        // AutoRoute(
        //   page: DevThemeTestRoute.page,
        //   path: '/dev/theme',
        //   initial: false,
        //   fullMatch: true,
        //   keepHistory: false,
        //   title: (context, data) {
        //     return 'Theme Test';
        //   },
        //   type: RouteType.material(),
        //   usesPathAsKey: true,
        // ),
      ];
}
