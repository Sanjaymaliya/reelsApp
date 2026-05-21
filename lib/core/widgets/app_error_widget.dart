import 'package:flutter/material.dart';
import 'package:reelsapps/extensions/app_extensions.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;

  final VoidCallback? onRetry;

  const AppErrorWidget({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,

        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),

          addVerticalSpace(16),

          Text(message, style: const TextStyle(color: Colors.white)),

          addVerticalSpace(20),

          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
