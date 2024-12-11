import 'package:flutter/material.dart';
import 'package:movies/features/watch_list/view/widgets/divider.dart';
import 'package:movies/features/watch_list/view/widgets/watch_list_item.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

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
            separatorBuilder: (context, index) => CustomDivider(),
            itemBuilder: (context, index) => WatchListItem(),
            itemCount: 8,
          ),
        )
      ],
    );
  }
}
