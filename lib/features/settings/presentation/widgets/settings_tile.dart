import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:quitra/core/theme/app_theme.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.onSurface, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: Icon(
        Directionality.of(context) == ui.TextDirection.rtl
            ? SolarIconsOutline.altArrowLeft
            : SolarIconsOutline.altArrowRight,
        size: 16,
        color: AppTheme.onSurfaceVariant.withValues(alpha: 0.5),
      ),
      onTap: onTap ?? () {},
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    );
  }
}