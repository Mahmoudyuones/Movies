import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/category_item.dart';
import 'package:movies/features/home/view/widgets/category_item_detailed.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/add.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background_display.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle_filled,
                  color: AppColors.white,
                  size: 80,
                ),
              ),
              PositionedDirectional(
                top: height * 0.1,
                start: width * 0.01,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/image_display.png',
                    ),
                    PositionedDirectional(
                      end: width *0.19,
                      bottom: height * 0.16,
                      child: Add(),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                top: height * 0.255,
                start: width * 0.4,
                child: Text(
                  'Dora and the lost city of gold',
                  style: titleLarge,
                ),
              ),
              PositionedDirectional(
                top: height * 0.3,
                start: width * 0.4,
                child: Row(
                  children: [
                    Text(
                      '2019',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'PG',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '2h 7m',
                      style: titleSmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.1),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    "New Releases",
                    style: titleLarge?.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => const CategoryItem(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.05),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    "Recommended",
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
    );
  }
}
