import 'package:flutter/material.dart';
import 'package:quitra/core/theme/app_theme.dart';

class SettingsVersionFooter extends StatelessWidget {
  final String appName;
  final String version;

  const SettingsVersionFooter({
    super.key,
    required this.appName,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$appName $version',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
      ),
    );
  }
}