import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              l10n.settingsTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "App preferences.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Card(
              child: ListTile(
                title: const Text('Language (Coming Soon)'),
                subtitle: const Text('Change app language here'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
