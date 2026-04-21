import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';

class QuitPlanPage extends StatelessWidget {
  const QuitPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.quitPlanLabel)),
      body: Center(child: Text(l10n.quitPlanLabel)),
    );
  }
}
