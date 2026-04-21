import 'package:flutter/material.dart';

class ProgressHeader extends StatelessWidget {
  final String title;

  const ProgressHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}