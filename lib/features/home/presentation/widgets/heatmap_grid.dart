import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../journey/domain/entities/journey_day.dart';

class HeatmapGrid extends StatelessWidget {
  final List<JourneyDay> history;

  const HeatmapGrid({
    super.key,
    required this.history,
  });

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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6, top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('M', style: TextStyle(fontSize: 9, color: AppTheme.onSurfaceVariant)),
              SizedBox(height: 7),
              Text('W', style: TextStyle(fontSize: 9, color: AppTheme.onSurfaceVariant)),
              SizedBox(height: 7),
              Text('F', style: TextStyle(fontSize: 9, color: AppTheme.onSurfaceVariant)),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const columns = 12;
              const rows = 7;
              const spacing = 3.0;
              const totalSpacing = spacing * (columns - 1);
              final cellSize = ((constraints.maxWidth - totalSpacing) / columns).clamp(6.0, 14.0);

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(columns, (colIndex) {
                    return Padding(
                      padding: EdgeInsets.only(right: colIndex == columns - 1 ? 0 : spacing),
                      child: Column(
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
                            margin: EdgeInsets.only(bottom: rowIndex == rows - 1 ? 0 : spacing),
                            decoration: BoxDecoration(
                              color: cellColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
