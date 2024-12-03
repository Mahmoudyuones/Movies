import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        isPressed = !isPressed;
        setState(() {});
      },
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.bookmark,
            color: isPressed ? AppColors.addGrey : AppColors.yellow,
            size: 50,
          ),
          Icon(
            isPressed ? Icons.add : Icons.check,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
