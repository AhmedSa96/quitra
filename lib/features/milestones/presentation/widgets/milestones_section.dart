import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/milestone.dart';
import 'milestone_card.dart';

class MilestonesSection extends StatefulWidget {
  final List<Milestone> milestones;
  final List<MilestoneCategory> allowedCategories;
  final String title;

  const MilestonesSection({
    super.key,
    required this.milestones,
    this.allowedCategories = const [
      MilestoneCategory.time,
      MilestoneCategory.healthRecovery,
      MilestoneCategory.savings,
      MilestoneCategory.consistency,
    ],
    this.title = 'Your Milestones',
  });

  @override
  State<MilestonesSection> createState() => _MilestonesSectionState();
}

class _MilestonesSectionState extends State<MilestonesSection> {
  MilestoneCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final filtered = widget.milestones.where((m) {
      if (!widget.allowedCategories.contains(m.category)) return false;
      if (_selectedCategory != null && m.category != _selectedCategory) return false;
      return true;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 12),
        // Category filter chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              FilterChip(
                selected: _selectedCategory == null,
                label: const Text('All'),
                onSelected: (_) => setState(() => _selectedCategory = null),
                backgroundColor: AppTheme.surfaceContainerLow,
                selectedColor: AppTheme.primary.withValues(alpha: 0.15),
                checkmarkColor: AppTheme.primary,
                side: BorderSide.none,
              ),
              const SizedBox(width: 8),
              ...widget.allowedCategories.map((cat) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    selected: _selectedCategory == cat,
                    label: Text(_getCategoryLabel(cat)),
                    onSelected: (_) => setState(() => _selectedCategory = cat),
                    backgroundColor: AppTheme.surfaceContainerLow,
                    selectedColor: AppTheme.primary.withValues(alpha: 0.15),
                    checkmarkColor: AppTheme.primary,
                    side: BorderSide.none,
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Milestone Cards Row
        SizedBox(
          height: 128,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            itemCount: filtered.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return MilestoneCard(milestone: filtered[index]);
            },
          ),
        ),
      ],
    );
  }

  String _getCategoryLabel(MilestoneCategory category) {
    switch (category) {
      case MilestoneCategory.time:
        return 'Time';
      case MilestoneCategory.healthRecovery:
        return 'Health';
      case MilestoneCategory.savings:
        return 'Savings';
      case MilestoneCategory.consistency:
        return 'Streak';
      case MilestoneCategory.strength:
        return 'Strength';
      case MilestoneCategory.dedication:
        return 'Dedication';
    }
  }
}
