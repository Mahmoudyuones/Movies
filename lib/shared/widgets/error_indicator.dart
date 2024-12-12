import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errMessage;
  const ErrorIndicator({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
