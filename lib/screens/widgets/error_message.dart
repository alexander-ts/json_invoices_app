import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  const ErrorMessage({
    super.key,
    required this.message,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          FilledButton(
            onPressed: onButtonPressed,
            child: Text(buttonTitle),
          ),
        ],
      ),
    );
  }
}
