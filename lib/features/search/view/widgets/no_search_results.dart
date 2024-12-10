import 'package:flutter/material.dart';

class NoSearchResults extends StatelessWidget {
  const NoSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const Icon(
          Icons.local_movies,
          color: Color(0xffB5B4B4),
          size: 100,
        ),
        Text(
          'No movies found',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
