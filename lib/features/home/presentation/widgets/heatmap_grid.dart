import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../../../../core/theme/app_theme.dart';
import '../../../journey/domain/entities/journey_day.dart';

class HeatmapGrid extends StatelessWidget {
  final List<JourneyDay> history;

  const HeatmapGrid({
    super.key,
    required this.history,
  });

  String? _getDayLabel(BuildContext context, int rowIndex) {
    if (rowIndex != 0 && rowIndex != 2 && rowIndex != 4) return null;
    try {
      final locale = Localizations.localeOf(context).toString();
      final symbols = DateFormat.E(locale).dateSymbols.NARROWWEEKDAYS;
      if (symbols.length >= 7) {
        if (rowIndex == 0) return symbols[1];
        if (rowIndex == 2) return symbols[3];
        if (rowIndex == 4) return symbols[5];
      }
    } catch (_) {}
    if (rowIndex == 0) return 'M';
    if (rowIndex == 2) return 'W';
    if (rowIndex == 4) return 'F';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentWeekday = today.weekday;
    final endOfGrid = today.add(Duration(days: 7 - currentWeekday));
    final startOfGrid = endOfGrid.subtract(const Duration(days: 12 * 7 - 1));

    final historyMap = <String, JourneyStatus>{};
    for (final day in history) {
      final key = '${day.date.year}-${day.date.month}-${day.date.day}';
      historyMap[key] = day.status;
    }

    const columns = 12;
    const rows = 7;
    const spacing = 3.5;
    const labelWidth = 14.0;
    const labelSpacing = 8.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableGridWidth = constraints.maxWidth - labelWidth - labelSpacing;
        const totalSpacing = spacing * (columns - 1);
        final cellSize = ((availableGridWidth - totalSpacing) / columns).clamp(8.0, 24.0);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: labelWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(rows, (rowIndex) {
                  final labelText = _getDayLabel(context, rowIndex);

                  return Container(
                    height: cellSize,
                    margin: EdgeInsets.only(
                      bottom: rowIndex == rows - 1 ? 0 : spacing,
                    ),
                    alignment: Alignment.center,
                    child: labelText != null
                        ? Text(
                            labelText,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.onSurfaceVariant,
                            ),
                          )
                        : null,
                  );
                }),
              ),
            ),
            const SizedBox(width: labelSpacing),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(columns, (colIndex) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(rows, (rowIndex) {
                      final dayOffset = colIndex * 7 + rowIndex;
                      final date = startOfGrid.add(Duration(days: dayOffset));
                      final isFuture = date.isAfter(today);
                      final key = '${date.year}-${date.month}-${date.day}';
                      final status = historyMap[key];

                      Color cellColor = AppTheme.surfaceContainerLow;
                      if (!isFuture) {
                        if (status == JourneyStatus.clean) {
                          cellColor = AppTheme.primary;
                        } else if (status == JourneyStatus.setback) {
                          cellColor = const Color(0xFFE57373);
                        } else if (status == JourneyStatus.craving) {
                          cellColor = const Color(0xFFF59E0B);
                        }
                      }

                      return Container(
                        width: cellSize,
                        height: cellSize,
                        margin: EdgeInsets.only(
                          bottom: rowIndex == rows - 1 ? 0 : spacing,
                        ),
                        decoration: BoxDecoration(
                          color: cellColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
