import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

@RoutePage(deferredLoading: false)
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: create a more screen with variations for compact, medium and expanded
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text('More'),
        ),
        SliverPadding(
          padding: AppTheme.dl.sys.dimension.space.edge,
          sliver: SliverList.list(children: []),
        ),
      ],
    );
  }
}
