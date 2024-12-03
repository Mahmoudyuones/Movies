import 'package:flutter/material.dart';
import 'package:movies/features/browse/view/widgets/borwse_category_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              'Browse Category ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (_, index) => const BorwseCategoryItem(
                  categoryName: 'Action', imageName: 'category_item'),
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
