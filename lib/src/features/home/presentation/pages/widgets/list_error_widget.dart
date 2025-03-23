import 'package:flutter/material.dart';

class ListErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onTryAgain;
  const ListErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton.icon(
          onPressed: onTryAgain,
          icon: const Icon(Icons.refresh),
          label: const Text('Try Again'),
        ),
      ],
    );
  }
}
