import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';

class JourneyDayNoteCard extends StatefulWidget {
  final String? initialNote;
  final Function(String) onSave;

  const JourneyDayNoteCard({
    super.key, 
    this.initialNote,
    required this.onSave,
  });

  @override
  State<JourneyDayNoteCard> createState() => _JourneyDayNoteCardState();
}

class _JourneyDayNoteCardState extends State<JourneyDayNoteCard> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNote);
  }

  @override
  void didUpdateWidget(covariant JourneyDayNoteCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialNote != widget.initialNote && !_isEditing) {
      _controller.text = widget.initialNote ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.04),
            blurRadius: 40,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.journalNoteLabel,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_isEditing) {
                    widget.onSave(_controller.text);
                  }
                  setState(() => _isEditing = !_isEditing);
                },
                child: Text(
                  _isEditing ? l10n.saveNoteAction : l10n.editNoteAction,
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_isEditing)
            TextField(
              controller: _controller,
              maxLines: null,
              autofocus: true,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: AppTheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: l10n.addNoteOptional,
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5)),
              ),
            )
          else
            Text(
              _controller.text.isEmpty ? l10n.addNoteOptional : _controller.text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: _controller.text.isEmpty 
                    ? AppTheme.onSurfaceVariant.withValues(alpha: 0.5)
                    : AppTheme.onSurface,
                fontStyle: _controller.text.isEmpty ? FontStyle.italic : null,
              ),
            ),
        ],
      ),
    );
  }
}
