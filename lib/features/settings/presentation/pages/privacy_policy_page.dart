import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyPolicyLabel)),
      body: Center(child: Text(l10n.privacyPolicyLabel)),
    );
  }
}
