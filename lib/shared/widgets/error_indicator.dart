import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String errMessage;

  const ErrorIndicator({Key? key, required this.errMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: 50, color: Colors.redAccent),
          const SizedBox(height: 10),
          Text(
            errMessage,
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          
        ],
      ),
    );
  }
}
