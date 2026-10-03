import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

class WeeklyTrendSection extends StatelessWidget {
  final List<int> dailyCravingCounts;
  final int? todayIndex;
  final String? title;

  const WeeklyTrendSection({
    super.key,
    required this.dailyCravingCounts,
    this.todayIndex,
    this.title,
  });

  List<String> _getLocalizedDayLabels(BuildContext context) {
    try {
      final locale = Localizations.localeOf(context).toString();
      final symbols = DateFormat.E(locale).dateSymbols.NARROWWEEKDAYS;
      if (symbols.length >= 7) {
        return [
          symbols[1],
          symbols[2],
          symbols[3],
          symbols[4],
          symbols[5],
          symbols[6],
          symbols[0],
        ];
      }
    } catch (_) {}
    return const ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final total = dailyCravingCounts.fold<int>(0, (sum, count) => sum + count);
    final effectiveTodayIndex = todayIndex ?? (DateTime.now().weekday - 1);
    final displayTitle = title ?? l10n?.thisWeekTitle ?? 'This Week';
    final dayLabels = _getLocalizedDayLabels(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        SanctuaryCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n?.cravingTrendTitle ?? 'Craving Trend',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.onSurface,
                        ),
                  ),
                  Text(
                    l10n?.cravingMomentsCount(total) ?? '$total moments',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: CustomPaint(
                  painter: WeeklyTrendPainter(
                    counts: dailyCravingCounts,
                    todayIndex: effectiveTodayIndex,
                    primaryColor: AppTheme.primary,
                    surfaceColor: AppTheme.surfaceContainerLow,
                    textColor: AppTheme.onSurfaceVariant,
                    dayLabels: dayLabels,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WeeklyTrendPainter extends CustomPainter {
  final List<int> counts;
  final int todayIndex;
  final Color primaryColor;
  final Color surfaceColor;
  final Color textColor;
  final List<String> dayLabels;

  static const List<String> _defaultDayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  WeeklyTrendPainter({
    required this.counts,
    required this.todayIndex,
    required this.primaryColor,
    required this.surfaceColor,
    required this.textColor,
    this.dayLabels = _defaultDayLabels,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const labelHeight = 20.0;
    const labelSpacing = 8.0;
    final chartHeight = size.height - labelHeight - labelSpacing;
    final dayCount = 7;
    final slotWidth = size.width / dayCount;
    final barWidth = (slotWidth * 0.4).clamp(10.0, 22.0);

    final maxCount = counts.isEmpty ? 1 : max(1, counts.reduce(max));

    final barPaint = Paint()..style = PaintingStyle.fill;
    final dotPaint = Paint()
      ..color = surfaceColor
      ..style = PaintingStyle.fill;
    final todayPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dayCount; i++) {
      final count = i < counts.length ? counts[i] : 0;
      final centerX = (i + 0.5) * slotWidth;

      // Highlight today column background softly
      if (i == todayIndex) {
        final highlightRect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(centerX, chartHeight / 2),
            width: slotWidth * 0.85,
            height: chartHeight + 6,
          ),
          const Radius.circular(12),
        );
        canvas.drawRRect(highlightRect, todayPaint);
      }

      if (count == 0) {
        // Dot at bottom of chart
        final dotCenter = Offset(centerX, chartHeight - 6);
        canvas.drawCircle(dotCenter, 3.5, dotPaint);
      } else {
        // Proportional rounded bar
        final barHeight = ((count / maxCount) * (chartHeight - 12)).clamp(8.0, chartHeight);
        final top = chartHeight - barHeight;
        final barRect = RRect.fromRectAndRadius(
          Rect.fromLTWH(centerX - (barWidth / 2), top, barWidth, barHeight),
          const Radius.circular(6),
        );

        final opacity = (0.35 + 0.65 * (count / maxCount)).clamp(0.0, 1.0);
        barPaint.color = primaryColor.withValues(alpha: opacity);
        canvas.drawRRect(barRect, barPaint);
      }

      // Draw day label text
      final textSpan = TextSpan(
        text: i < dayLabels.length ? dayLabels[i] : '',
        style: TextStyle(
          color: i == todayIndex ? primaryColor : textColor,
          fontWeight: i == todayIndex ? FontWeight.bold : FontWeight.w500,
          fontSize: 12,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(centerX - (textPainter.width / 2), size.height - labelHeight + 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant WeeklyTrendPainter oldDelegate) {
    return oldDelegate.counts != counts ||
        oldDelegate.todayIndex != todayIndex ||
        oldDelegate.primaryColor != primaryColor ||
        oldDelegate.dayLabels != dayLabels;
  }
}
