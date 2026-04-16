import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class DailyCheckInDialog extends StatefulWidget {
  const DailyCheckInDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<HomeBloc>(),
        child: const DailyCheckInDialog(),
      ),
    );
  }

  @override
  State<DailyCheckInDialog> createState() => _DailyCheckInDialogState();
}

class _DailyCheckInDialogState extends State<DailyCheckInDialog> {
  bool _wasSmoked = false;
  double _cravingLevel = 1;
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 32,
        bottom: 32 + bottomInset,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.howWasYourDay,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(SolarIconsOutline.closeCircle),
                color: AppTheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // Question 1: Smoked?
          _buildActionRow(
            context,
            icon: SolarIconsOutline.fire,
            title: "Did you smoke today?", // TODO: Localize
            trailing: Switch.adaptive(
              value: _wasSmoked,
              activeColor: AppTheme.primary,
              onChanged: (value) => setState(() => _wasSmoked = value),
            ),
          ),
          const SizedBox(height: 24),

          // Question 2: Cravings
          Text(
            "Cravings intensity", // TODO: Localize
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Slider(
            value: _cravingLevel,
            min: 1,
            max: 5,
            divisions: 4,
            activeColor: AppTheme.primary,
            inactiveColor: AppTheme.surfaceContainerLow,
            onChanged: (value) => setState(() => _cravingLevel = value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) => Text("${index + 1}")),
            ),
          ),
          const SizedBox(height: 24),

          // Question 3: Note
          TextField(
            controller: _noteController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Add a note (optional)", // TODO: Localize
              filled: true,
              fillColor: AppTheme.surfaceContainerLowest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Submit Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppTheme.signatureGradient,
                borderRadius: BorderRadius.circular(28),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeEvent.saveDailyCheckIn(
                    wasSmoked: _wasSmoked,
                    cravingLevel: _cravingLevel.toInt(),
                    note: _noteController.text.isNotEmpty ? _noteController.text : null,
                  ));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text("Save Journal"), // TODO: Localize
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context, {
    required IconData icon,
    required String title,
    required Widget trailing,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primary),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}
