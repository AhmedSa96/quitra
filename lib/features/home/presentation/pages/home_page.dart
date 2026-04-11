import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.homeTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.homeWelcome,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppTheme.onSurfaceVariant),
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.homeDashboardTitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.homeDashboardDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Placeholder for Craving Button
            Container(
              width: double.infinity,
              height: 80,
              decoration: ShapeDecoration(
                gradient: AppTheme.signatureGradient,
                shape: const StadiumBorder(),
              ),
              child: Center(
                child: Text(
                  l10n.craveButton,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
