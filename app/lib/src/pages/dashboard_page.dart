import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

@RoutePage(deferredLoading: false)
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text('Your Dashboard'),
        ),
        SliverPadding(
          padding: AppTheme.dl.sys.dimension.space.edge,
          sliver: SliverList.list(children: []),
        ),
      ],
    );
  }
}
