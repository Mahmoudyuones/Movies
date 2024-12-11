import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/add.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class WatchListItem extends StatelessWidget {
  const WatchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

    return Container(
      height: height * 0.2, 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  height: height * 0.15, 
                  width: width * 0.45,  
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16), 
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.08, // Adjust the position of the Add button if needed
                child: Add(),
              ),
            ],
          ),
          const SizedBox(width: 16), // Space between the image and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Alita Battle Angel',
                  style: titleLarge?.copyWith(fontSize: 15),
                ),
                Text(
                  '2019',
                  style: titleLarge?.copyWith(fontSize: 13),
                ),
                Row(
                  children: [
                    Text(
                      'Rosa Salazar , ',
                      style: titleLarge?.copyWith(fontSize: 13),
                    ),
                    Text(
                      'Christoph Waltz',
                      style: titleLarge?.copyWith(fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
