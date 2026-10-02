import 'package:flutter/material.dart';

class FadeScaleSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double beginScale;

  const FadeScaleSwitcher({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutBack,
    this.beginScale = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final disableAnimations = MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    if (disableAnimations) {
      return child;
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, progress, staticChild) {
        final scale = beginScale + (1.0 - beginScale) * progress;
        return Opacity(
          opacity: progress.clamp(0.0, 1.0),
          child: Transform.scale(
            scale: scale,
            child: staticChild,
          ),
        );
      },
      child: child,
    );
  }
}
