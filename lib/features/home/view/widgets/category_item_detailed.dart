import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';
import 'package:movies/shared/widgets/add.dart';

class CategoryItemDetailed extends StatelessWidget {
  const CategoryItemDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          width: width * 0.3,
          child: Column(
            children: [
              Image.asset(
                'assets/images/image_display.png',
              ),
              Container(
                width: width * 0.3,
                height: height * 0.1,
                color: AppColors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yellow,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '7.7',
                            style: titleLarge?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Deadpool',
                        style: titleLarge?.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Text(
                            '2018',
                            style: titleSmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'R',
                            style: titleSmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '1h 59m',
                            style: titleSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Positioned(
          top: 5,
          left: 1,
          child: Add(),
        ),
      ],
    );
  }
}
