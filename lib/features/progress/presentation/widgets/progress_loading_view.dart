import 'package:flutter/material.dart';

class ProgressLoadingView extends StatelessWidget {
  const ProgressLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}