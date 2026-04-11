import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';

class JourneyPage extends StatelessWidget {
  const JourneyPage({super.key});

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
              l10n.journeyTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Your milestones.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Center(child: Text(l10n.journeyComingSoon)),
          ],
        ),
      ),
    );
  }
}
