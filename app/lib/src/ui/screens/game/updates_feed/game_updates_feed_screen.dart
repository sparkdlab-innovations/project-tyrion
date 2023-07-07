import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/game/updates_feed/game_update_feed_card.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameUpdatesFeedScreen extends StatelessWidget {
  const GameUpdatesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Your Updates'),
            floating: true,
            snap: true,
            actions: [
              // TODO: open menu on click
              // IconButton(
              //   icon: Icon(Icons.more_vert_rounded),
              //   onPressed: () {},
              // ),
            ],
          ),
        ],
        body: RefreshIndicator(
          onRefresh: () async {
            return Future.delayed(Duration(seconds: 2));
          },
          child: ListView.separated(
            shrinkWrap: true,
            padding: AppTheme.dl.sys.dimension.space.edge,
            itemBuilder: (context, index) {
              return GameUpdateFeedCard();
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: AppTheme.dl.sys.dimension.baseDimension),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
