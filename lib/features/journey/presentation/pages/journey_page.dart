import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';

class JourneyPage extends StatelessWidget {
  const JourneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.journeyTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 32),
            
            Text(
              l10n.journeyHistoryTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Timeline items using background shifts instead of rigid lines
            _buildTimelineItem(context, "April 11", l10n.cleanStatus, SolarIconsBold.checkCircle, const Color(0xFF66BB6A)),
            _buildTimelineItem(context, "April 10", l10n.cravingStatus, SolarIconsBold.fire, const Color(0xFFFFA726)),
            _buildTimelineItem(context, "April 9", l10n.cleanStatus, SolarIconsBold.checkCircle, const Color(0xFF66BB6A)),
            _buildTimelineItem(context, "April 8", l10n.setbackStatus, SolarIconsBold.closeCircle, const Color(0xFFEF5350)),
            _buildTimelineItem(context, "April 7", l10n.cleanStatus, SolarIconsBold.checkCircle, const Color(0xFF66BB6A)),
            _buildTimelineItem(context, "April 6", l10n.cleanStatus, SolarIconsBold.checkCircle, const Color(0xFF66BB6A)),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String date, String status, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Soft background shift for item separation
        color: AppTheme.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Icon Container with white card feel
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            SolarIconsOutline.altArrowRight,
            size: 20,
            color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
        ],
      ),
    );
  }
}
