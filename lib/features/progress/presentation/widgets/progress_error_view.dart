import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quitra/l10n/app_localizations.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:quitra/features/progress/presentation/bloc/progress_event.dart';

class ProgressErrorView extends StatelessWidget {
  const ProgressErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.databaseError, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ProgressBloc>().add(ProgressEvent.loadProgress());
              },
              child: Text(l10n.continueButton),
            ),
          ],
        ),
      ),
    );
  }
}