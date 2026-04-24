import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/core/services/ad_service.dart';
import 'package:quitra/core/theme/app_theme.dart';
import 'package:quitra/l10n/app_localizations.dart';

class CravingOutcomeDialog extends StatefulWidget {
  const CravingOutcomeDialog({super.key});

  @override
  State<CravingOutcomeDialog> createState() => _CravingOutcomeDialogState();
}

class _CravingOutcomeDialogState extends State<CravingOutcomeDialog> {
  bool _isAdLoading = false;

  Future<void> _onSmokedTap() async {
    setState(() => _isAdLoading = true);

    await AdService.showRewardedAd();

    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.06),
              blurRadius: 40,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                SolarIconsBold.wind,
                color: AppTheme.primary,
                size: 48,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.howWasYourDay,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                "Take a breath. Be honest with yourself.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),

              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: AppTheme.signatureGradient,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      "I stayed strong",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: _isAdLoading ? null : _onSmokedTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isAdLoading
                      ? const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppTheme.primary,
                            ),
                          ),
                        )
                      : const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  SolarIconsOutline.play,
                                  color: AppTheme.onSurface,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "I had one cigarette",
                                  style: TextStyle(
                                    color: AppTheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Watch ad to record",
                              style: TextStyle(
                                color: AppTheme.onSurfaceVariant,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
