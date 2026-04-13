import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'failures.dart';

extension FailureMessages on Failure {
  String message(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return when(
      serverError: () => l10n.serverError,
      networkError: () => l10n.networkError,
      unexpectedError: () => l10n.unexpectedError,
      cacheError: () =>
          "temp error message for cache error", // TODO: l10n.cacheError,
    );
  }
}
