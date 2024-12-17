import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class Add extends StatefulWidget {
  final int movieId;
  final String title;
  final String releaseDate;
  final String imageUrl;

  const Add({
    super.key,
    required this.movieId,
    required this.title,
    required this.releaseDate,
    required this.imageUrl,
  });

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  late Box favoritesBox;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    favoritesBox = await Hive.openBox('favorites');

    setState(() {
      isPressed = favoritesBox.containsKey(widget.movieId);
    });
  }

  void toggleFavorite() {
    if (favoritesBox.containsKey(widget.movieId)) {
      favoritesBox.delete(widget.movieId);
    } else {
      favoritesBox.put(
        widget.movieId,
        {
          'id': widget.movieId,
          'title': widget.title,
          'releaseDate': widget.releaseDate,
          'imageUrl': widget.imageUrl,
        },
      );
    }

    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleFavorite,
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.bookmark,
            color: isPressed
                ? AppColors.yellow
                : const Color.fromARGB(214, 81, 79, 79),
            size: 50,
          ),
          Icon(
            isPressed ? Icons.check : Icons.add,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
