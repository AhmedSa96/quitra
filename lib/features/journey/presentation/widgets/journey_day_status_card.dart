import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/core/services/ad_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/journey_day.dart';

class JourneyDayStatusCard extends StatelessWidget {
  final JourneyDay day;
  final bool isInteractive;
  final Function(bool)? onWasSmokedChanged;
  final Function(int)? onCravingLevelChanged;

  const JourneyDayStatusCard({
    super.key,
    required this.day,
    this.isInteractive = false,
    this.onWasSmokedChanged,
    this.onCravingLevelChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _getStatusColor(day.status);
    final statusIcon = _getStatusIcon(day.status);
    final statusText = _getStatusText(day.status, l10n);
    final wasSmoked = day.status == JourneyStatus.setback;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: statusColor.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(statusIcon, color: statusColor, size: 48),
          ),
          const SizedBox(height: 16),
          Text(
            statusText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.onSurface,
            ),
          ),
          if (isInteractive) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _handleSmokeToggle(context, !wasSmoked),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: wasSmoked
                      ? AppTheme.primary.withValues(alpha: 0.1)
                      : AppTheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!wasSmoked) ...[
                      const Icon(
                        SolarIconsOutline.play,
                        color: AppTheme.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      wasSmoked ? l10n.cleanStatus : "Mark as smoked",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: wasSmoked
                            ? AppTheme.primary
                            : AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (!wasSmoked)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Watch ad to record",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ),
          ],
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final level = index + 1;
              final isActive = level <= (day.cravingLevel ?? 0);
              return GestureDetector(
                onTap: isInteractive
                    ? () => onCravingLevelChanged?.call(level)
                    : null,
                child: Container(
                  width: 48,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFFFFA726)
                        : AppTheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.cravingsIntensity,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: AppTheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSmokeToggle(
    BuildContext context,
    bool wantToMarkSmoked,
  ) async {
    if (wantToMarkSmoked && onWasSmokedChanged != null) {
      await AdService.showRewardedAd();
      onWasSmokedChanged!(true);
    } else if (!wantToMarkSmoked && onWasSmokedChanged != null) {
      onWasSmokedChanged!(false);
    }
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
