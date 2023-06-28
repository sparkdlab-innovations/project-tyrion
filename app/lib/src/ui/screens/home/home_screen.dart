import 'package:auto_route/auto_route.dart';
import 'package:design_language/design_language.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/data/models/page/home_page/home_page_data.dart';
import 'package:tyrion/src/ui/screens/home/compact_home_screen.dart';
import 'package:tyrion/src/utils/router/app_router.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  final HomePageData data;

  const HomeScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: [
        ...data.pinnedSegmentsPageRouteInfos,
        DashboardRoute(),
        MoreRoute(),
      ],
      homeIndex: 0,
      physics: NeverScrollableScrollPhysics(),
      builder: (context, child, controller) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        switch (AppTheme.windowClass) {
          case WindowClass.expanded:
            throw UnimplementedError();
          case WindowClass.medium:
            throw UnimplementedError();
          default:
            return CompactHomeScreen(
              tabsRouter: tabsRouter,
              customDesintations: data.pinnedSegmentsDestinations,
              child: child,
            );
        }
      },
    );
  }
}
