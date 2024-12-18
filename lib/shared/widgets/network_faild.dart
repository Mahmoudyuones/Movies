import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme/app_colors.dart';

class NetWorkFaild extends StatefulWidget {
  final Function() onPressed;
  const NetWorkFaild({super.key, required this.onPressed});

  @override
  State<NetWorkFaild> createState() => _NetWorkFaildState();
}

class _NetWorkFaildState extends State<NetWorkFaild> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Text(
            'No Internet Connection',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Please check your connection and try again.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            child: Text(
              'Retry',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
