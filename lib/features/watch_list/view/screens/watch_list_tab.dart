import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies/shared/widgets/divider.dart';
import 'package:movies/features/watch_list/view/widgets/watch_list_item.dart';

class WatchListTab extends StatefulWidget {
  const WatchListTab({super.key});

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  late Box favoritesBox;
  @override
  void initState() {
    favoritesBox = Hive.box('favorites');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            'Watchist',
            style: titleLarge?.copyWith(fontSize: 22),
          ),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) =>const  CustomDivider(),
            itemBuilder: (context, index) {
              final movie = favoritesBox.getAt(index);
              return WatchListItem(
                imageUrl: movie['imageUrl'],
                releaseDate: movie['releaseDate'],
                title: movie['title'],
                id: movie['id'],
              );
            },
            itemCount: favoritesBox.length,
          ),
        )
      ],
    );
  }
}
