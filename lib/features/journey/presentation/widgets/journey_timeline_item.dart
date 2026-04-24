import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_bloc.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/journey_day.dart';

class JourneyTimelineItem extends StatelessWidget {
  final JourneyDay day;

  const JourneyTimelineItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _getStatusColor(day.status);
    final statusIcon = _getStatusIcon(day.status);
    final statusText = _getStatusText(day.status, l10n);
    final dateText = DateFormat('MMMM d').format(day.date);
    final router = GoRouter.of(context);
    final bloc = context.read<JourneyBloc>();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => router.push(
          '/journey-day-details',
          extra: {'day': day, 'bloc': bloc},
        ),
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceContainerLow.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: statusColor.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(statusIcon, color: statusColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      statusText,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dateText,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                    if (day.note != null && day.note!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        day.note!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Directionality.of(context) == ui.TextDirection.rtl
                    ? SolarIconsOutline.altArrowLeft
                    : SolarIconsOutline.altArrowRight,
                size: 20,
                color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(JourneyStatus status) {
    switch (status) {
      case JourneyStatus.clean:
        return const Color(0xFF66BB6A);
      case JourneyStatus.craving:
        return const Color(0xFFFFA726);
      case JourneyStatus.setback:
        return const Color(0xFFEF5350);
    }
  }

  IconData _getStatusIcon(JourneyStatus status) {
    switch (status) {
      case JourneyStatus.clean:
        return SolarIconsBold.checkCircle;
      case JourneyStatus.craving:
        return SolarIconsBold.fire;
      case JourneyStatus.setback:
        return SolarIconsBold.closeCircle;
    }
  }

  String _getStatusText(JourneyStatus status, AppLocalizations l10n) {
    switch (status) {
      case JourneyStatus.clean:
        return l10n.cleanStatus;
      case JourneyStatus.craving:
        return l10n.cravingsRecorded;
      case JourneyStatus.setback:
        return l10n.setbackRecorded;
    }
  }
}
