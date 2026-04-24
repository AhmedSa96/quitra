import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quitra/features/journey/domain/entities/journey_day.dart';
import 'package:quitra/features/journey/presentation/bloc/journey_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/journey_bloc.dart';
import '../bloc/journey_event.dart';
import '../widgets/journey_day_status_card.dart';
import '../widgets/journey_day_note_card.dart';

class JourneyDayDetailsPage extends StatefulWidget {
  final JourneyDay day;

  const JourneyDayDetailsPage({super.key, required this.day});

  @override
  State<JourneyDayDetailsPage> createState() => _JourneyDayDetailsPageState();
}

class _JourneyDayDetailsPageState extends State<JourneyDayDetailsPage> {
  final GlobalKey _screenshotKey = GlobalKey();
  bool _isSharing = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateText = DateFormat('MMMM d, yyyy').format(widget.day.date);
    final now = DateTime.now();
    final isToday =
        widget.day.date.year == now.year &&
        widget.day.date.month == now.month &&
        widget.day.date.day == now.day;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Directionality.of(context) == ui.TextDirection.rtl
                ? SolarIconsOutline.altArrowRight
                : SolarIconsOutline.altArrowLeft,
            color: AppTheme.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.dayDetailsTitle,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<JourneyBloc, JourneyState>(
        builder: (context, state) {
          final currentDay = state.maybeWhen(
            loaded: (history) => history.firstWhere(
              (d) =>
                  d.date.year == widget.day.date.year &&
                  d.date.month == widget.day.date.month &&
                  d.date.day == widget.day.date.day,
              orElse: () => widget.day,
            ),
            orElse: () => widget.day,
          );

          final daysSmokeFree = state.maybeWhen(
            loaded: (history) {
              final cleanDays = history
                  .where((d) => d.status == JourneyStatus.clean)
                  .length;
              return cleanDays;
            },
            orElse: () => 0,
          );

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RepaintBoundary(
                    key: _screenshotKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateText,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: AppTheme.onSurface,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                        ),
                        const SizedBox(height: 32),
                        JourneyDayStatusCard(
                          day: currentDay,
                          isInteractive: isToday,
                          onWasSmokedChanged: (value) {
                            context.read<JourneyBloc>().add(
                              JourneyEvent.updateDay(
                                date: currentDay.date,
                                wasSmoked: value,
                              ),
                            );
                          },
                          onCravingLevelChanged: (level) {
                            context.read<JourneyBloc>().add(
                              JourneyEvent.updateDay(
                                date: currentDay.date,
                                cravingLevel: level,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        JourneyDayNoteCard(
                          initialNote: currentDay.note,
                          onSave: (newNote) {
                            context.read<JourneyBloc>().add(
                              JourneyEvent.updateDay(
                                date: currentDay.date,
                                note: newNote,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isSharing
                          ? null
                          : () => _captureAndShare(daysSmokeFree),
                      icon: _isSharing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(SolarIconsOutline.share),
                      label: Text(l10n.share),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _captureAndShare(int daysSmokeFree) async {
    setState(() => _isSharing = true);

    try {
      final boundary =
          _screenshotKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) {
        setState(() => _isSharing = false);
        return;
      }

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        setState(() => _isSharing = false);
        return;
      }

      final pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = File(
        '${tempDir.path}/quitra_journey_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(pngBytes);

      final shareText = daysSmokeFree > 0
          ? "I'm $daysSmokeFree days smoke-free! Join me on Quitra"
          : "Starting my smoke-free journey! Join me on Quitra";

      await Share.shareXFiles([XFile(file.path)], text: shareText);
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }
}
