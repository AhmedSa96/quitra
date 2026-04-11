import 'package:flutter/material.dart';
import 'package:quitra/l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../progress/presentation/pages/progress_page.dart';
import '../../../journey/presentation/pages/journey_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ProgressPage(),
    JourneyPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _pages),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceContainerLowest,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.06),
              blurRadius: 40,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppTheme.primary,
          unselectedItemColor: AppTheme.onSurfaceVariant,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: l10n.homeTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.bar_chart_outlined),
              activeIcon: const Icon(Icons.bar_chart),
              label: l10n.progressTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.auto_graph_outlined),
              activeIcon: const Icon(Icons.auto_graph),
              label: l10n.journeyTitle,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              label: l10n.settingsTitle,
            ),
          ],
        ),
      ),
    );
  }
}
