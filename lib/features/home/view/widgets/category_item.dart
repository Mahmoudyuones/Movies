import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/add.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          height: height * 0.2,
          width: width * 0.2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/image_display.png',
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: height * 0.02,
          end: width * 0.1,
          child: Add(),
        ),
      ],
    );
  }
}
