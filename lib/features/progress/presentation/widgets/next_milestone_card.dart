import 'dart:math';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/presentation/widgets/sanctuary_card.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../milestones/domain/entities/milestone.dart';
import '../../../milestones/presentation/extensions/milestone_localization_extension.dart';
import '../../../milestones/presentation/widgets/milestone_unlock_sheet.dart';
import '../../domain/entities/progress_stats.dart';

class NextMilestoneCard extends StatefulWidget {
  final List<Milestone> milestones;
  final ProgressStats? stats;

  const NextMilestoneCard({
    super.key,
    required this.milestones,
    this.stats,
  });

  @override
  State<NextMilestoneCard> createState() => _NextMilestoneCardState();
}

class _NextMilestoneCardState extends State<NextMilestoneCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _animController.forward();
  }

  @override
  void didUpdateWidget(covariant NextMilestoneCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stats != widget.stats ||
        oldWidget.milestones != widget.milestones) {
      _animController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  double _calculateProgress(Milestone milestone) {
    final stats = widget.stats;
    if (milestone.isUnlocked) return 1.0;
    if (stats == null) return 0.0;

    double current = 0.0;
    switch (milestone.category) {
      case MilestoneCategory.time:
        current = stats.daysSmokeFree.toDouble();
        break;
      case MilestoneCategory.healthRecovery:
        if (milestone.id == 'health_heart') {
          current = stats.heartRateProgress;
        } else if (milestone.id == 'health_circulation') {
          current = stats.circulationProgress;
        } else if (milestone.id == 'health_lungs') {
          current = stats.lungFunctionProgress;
        }
        break;
      case MilestoneCategory.savings:
        current = stats.moneySaved;
        break;
      case MilestoneCategory.consistency:
        current = stats.currentStreak.toDouble();
        break;
      case MilestoneCategory.strength:
        current = 0.0;
        break;
      case MilestoneCategory.dedication:
        current = 0.0;
        break;
    }

    if (milestone.threshold <= 0) return 0.0;
    return (current / milestone.threshold).clamp(0.0, 1.0);
  }

  (Milestone?, double) _findTargetMilestone() {
    if (widget.milestones.isEmpty) return (null, 0.0);

    final lockedMilestones =
        widget.milestones.where((m) => !m.isUnlocked).toList();

    if (lockedMilestones.isEmpty) {
      // All unlocked!
      return (null, 1.0);
    }

    Milestone bestMilestone = lockedMilestones.first;
    double maxProgress = -1.0;

    for (final milestone in lockedMilestones) {
      final progress = _calculateProgress(milestone);
      if (progress > maxProgress) {
        maxProgress = progress;
        bestMilestone = milestone;
      }
    }

    return (bestMilestone, max(0.0, maxProgress));
  }

  IconData _getIconData(String name) {
    switch (name) {
      case 'heartPulse':
        return SolarIconsOutline.heartPulse;
      case 'routing':
        return SolarIconsOutline.routing;
      case 'wind':
        return SolarIconsOutline.wind;
      case 'walletMoney':
        return SolarIconsOutline.walletMoney;
      case 'fire':
        return SolarIconsOutline.fire;
      case 'shieldCheck':
        return SolarIconsOutline.shieldCheck;
      case 'notes':
        return SolarIconsOutline.notes;
      case 'calendarMinimalistic':
      default:
        return SolarIconsOutline.calendarMinimalistic;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (milestone, targetProgress) = _findTargetMilestone();
    final isAllComplete = milestone == null && widget.milestones.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n?.nextMilestoneTitle ?? 'Next Milestone',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        SanctuaryCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: AnimatedBuilder(
            animation: _progressAnimation,
            builder: (context, child) {
              final animatedProgress = targetProgress * _progressAnimation.value;
              final percent = (animatedProgress * 100).toInt();

              if (isAllComplete) {
                return _buildAllCompletedView(context, l10n);
              }

              if (milestone == null) {
                return _buildLoadingOrEmptyView(context);
              }

              return InkWell(
                onTap: () => MilestoneUnlockSheet.show(context, milestone),
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  children: [
                    // Circular Progress Ring
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(130, 130),
                            painter: _ProgressRingPainter(
                              progress: animatedProgress,
                              trackColor: AppTheme.surfaceContainerLow,
                              gradientColors: const [
                                AppTheme.primary,
                                AppTheme.primaryContainer,
                              ],
                              strokeWidth: 10,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '$percent%',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.onSurface,
                                      letterSpacing: -0.5,
                                    ),
                              ),
                              Text(
                                l10n?.milestoneComplete ?? 'Completed',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: AppTheme.onSurfaceVariant,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Category Chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getIconData(milestone.iconName),
                            size: 14,
                            color: AppTheme.primary,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            milestone.category.localizedName(context),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: AppTheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Milestone Title
                    Text(
                      milestone.localizedTitle(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 4),
                    // Milestone Description / Health benefit
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        milestone.localizedDescription(context),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.onSurfaceVariant,
                              height: 1.4,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllCompletedView(BuildContext context, AppLocalizations? l10n) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              SolarIconsBold.cupStar,
              color: Color(0xFF22C55E),
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n?.allMilestonesAchieved ?? 'All Milestones Achieved!',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.onSurface,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n?.allMilestonesAchievedDesc ??
                'You have achieved every single milestone on your journey. Truly remarkable!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingOrEmptyView(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final List<Color> gradientColors;
  final double strokeWidth;

  _ProgressRingPainter({
    required this.progress,
    required this.trackColor,
    required this.gradientColors,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, trackPaint);

    if (progress <= 0) return;

    // Animated Sweep Arc
    final sweepAngle = 2 * pi * progress.clamp(0.0, 1.0);
    final rect = Rect.fromCircle(center: center, radius: radius);

    final sweepGradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: gradientColors,
      transform: const GradientRotation(-pi / 2),
    );

    final progressPaint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
