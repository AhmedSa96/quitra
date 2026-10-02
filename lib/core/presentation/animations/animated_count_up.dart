import 'package:flutter/material.dart';

class AnimatedCountUp extends StatelessWidget {
  final num value;
  final Duration duration;
  final Curve curve;
  final TextStyle? style;
  final String prefix;
  final String suffix;
  final int fractionDigits;

  const AnimatedCountUp({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.easeOut,
    this.style,
    this.prefix = '',
    this.suffix = '',
    this.fractionDigits = 0,
  });

  @override
  Widget build(BuildContext context) {
    final disableAnimations = MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    if (disableAnimations) {
      final formatted = fractionDigits == 0
          ? value.toInt().toString()
          : value.toStringAsFixed(fractionDigits);
      return Text('$prefix$formatted$suffix', style: style);
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.toDouble()),
      duration: duration,
      curve: curve,
      builder: (context, animatedValue, child) {
        final formatted = fractionDigits == 0
            ? animatedValue.toInt().toString()
            : animatedValue.toStringAsFixed(fractionDigits);
        return Text('$prefix$formatted$suffix', style: style);
      },
    );
  }
}
