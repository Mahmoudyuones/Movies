import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/category_chips.dart';
import 'package:movies/features/home/view/widgets/category_item_detailed.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class HomeDetails extends StatelessWidget {
  static const String routeName = 'Details';
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['Action', 'Drama', 'Comedy', 'Adventure'];

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dora and the lost city of gold',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.25,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'Dora and the lost city of gold',
                style: titleLarge?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2019',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    Text(
                      'Pg-13',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    Text(
                      '2h 7m',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      child: SizedBox(
                        height: height * 0.28,
                        width: width * 0.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/4bXIKqdZIjR8wKgZaGDaLhLj4yF.jpg',
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                    const Add(),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryChips(
                        categories: categories,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                          style: titleSmall?.copyWith(
                            fontSize: 13,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.yellow,
                          ),
                          Text(
                            '7.7',
                            style: titleLarge?.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: height * 0.44,
              width: double.infinity,
              color: AppColors.darkGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'More Like This',
                      style: titleLarge?.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          const CategoryItemDetailed(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
