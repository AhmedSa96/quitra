import 'package:flutter/widgets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/milestone.dart';

extension MilestoneLocalization on Milestone {
  String localizedTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return titleKey;

    switch (titleKey) {
      case 'milestoneFirstDayTitle':
        return l10n.milestoneFirstDayTitle;
      case 'milestoneThreeDaysTitle':
        return l10n.milestoneThreeDaysTitle;
      case 'milestoneOneWeekTitle':
        return l10n.milestoneOneWeekTitle;
      case 'milestoneTwoWeeksTitle':
        return l10n.milestoneTwoWeeksTitle;
      case 'milestoneOneMonthTitle':
        return l10n.milestoneOneMonthTitle;
      case 'milestoneThreeMonthsTitle':
        return l10n.milestoneThreeMonthsTitle;
      case 'milestoneSixMonthsTitle':
        return l10n.milestoneSixMonthsTitle;
      case 'milestoneOneYearTitle':
        return l10n.milestoneOneYearTitle;
      case 'milestoneHeartHealingTitle':
        return l10n.milestoneHeartHealingTitle;
      case 'milestoneCirculationTitle':
        return l10n.milestoneCirculationTitle;
      case 'milestoneBreathingTitle':
        return l10n.milestoneBreathingTitle;
      case 'milestoneSaved10Title':
        return l10n.milestoneSaved10Title;
      case 'milestoneSaved50Title':
        return l10n.milestoneSaved50Title;
      case 'milestoneSaved100Title':
        return l10n.milestoneSaved100Title;
      case 'milestoneSaved500Title':
        return l10n.milestoneSaved500Title;
      case 'milestoneStreak7Title':
        return l10n.milestoneStreak7Title;
      case 'milestoneStreak30Title':
        return l10n.milestoneStreak30Title;
      case 'milestoneStreak100Title':
        return l10n.milestoneStreak100Title;
      case 'milestoneFirstMomentTitle':
        return l10n.milestoneFirstMomentTitle;
      case 'milestoneTenMomentsTitle':
        return l10n.milestoneTenMomentsTitle;
      case 'milestoneFiftyMomentsTitle':
        return l10n.milestoneFiftyMomentsTitle;
      case 'milestoneSevenCheckInsTitle':
        return l10n.milestoneSevenCheckInsTitle;
      case 'milestoneThirtyCheckInsTitle':
        return l10n.milestoneThirtyCheckInsTitle;
      default:
        return titleKey;
    }
  }

  String localizedDescription(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return descriptionKey;

    switch (descriptionKey) {
      case 'milestoneFirstDayDesc':
        return l10n.milestoneFirstDayDesc;
      case 'milestoneThreeDaysDesc':
        return l10n.milestoneThreeDaysDesc;
      case 'milestoneOneWeekDesc':
        return l10n.milestoneOneWeekDesc;
      case 'milestoneTwoWeeksDesc':
        return l10n.milestoneTwoWeeksDesc;
      case 'milestoneOneMonthDesc':
        return l10n.milestoneOneMonthDesc;
      case 'milestoneThreeMonthsDesc':
        return l10n.milestoneThreeMonthsDesc;
      case 'milestoneSixMonthsDesc':
        return l10n.milestoneSixMonthsDesc;
      case 'milestoneOneYearDesc':
        return l10n.milestoneOneYearDesc;
      case 'milestoneHeartHealingDesc':
        return l10n.milestoneHeartHealingDesc;
      case 'milestoneCirculationDesc':
        return l10n.milestoneCirculationDesc;
      case 'milestoneBreathingDesc':
        return l10n.milestoneBreathingDesc;
      case 'milestoneSaved10Desc':
        return l10n.milestoneSaved10Desc;
      case 'milestoneSaved50Desc':
        return l10n.milestoneSaved50Desc;
      case 'milestoneSaved100Desc':
        return l10n.milestoneSaved100Desc;
      case 'milestoneSaved500Desc':
        return l10n.milestoneSaved500Desc;
      case 'milestoneStreak7Desc':
        return l10n.milestoneStreak7Desc;
      case 'milestoneStreak30Desc':
        return l10n.milestoneStreak30Desc;
      case 'milestoneStreak100Desc':
        return l10n.milestoneStreak100Desc;
      case 'milestoneFirstMomentDesc':
        return l10n.milestoneFirstMomentDesc;
      case 'milestoneTenMomentsDesc':
        return l10n.milestoneTenMomentsDesc;
      case 'milestoneFiftyMomentsDesc':
        return l10n.milestoneFiftyMomentsDesc;
      case 'milestoneSevenCheckInsDesc':
        return l10n.milestoneSevenCheckInsDesc;
      case 'milestoneThirtyCheckInsDesc':
        return l10n.milestoneThirtyCheckInsDesc;
      default:
        return descriptionKey;
    }
  }
}

extension MilestoneCategoryLocalization on MilestoneCategory {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return name;

    switch (this) {
      case MilestoneCategory.time:
        return l10n.milestoneCategoryTime;
      case MilestoneCategory.healthRecovery:
        return l10n.milestoneCategoryHealth;
      case MilestoneCategory.savings:
        return l10n.milestoneCategorySavings;
      case MilestoneCategory.consistency:
        return l10n.milestoneCategoryStreak;
      case MilestoneCategory.strength:
        return l10n.milestoneCategoryStrength;
      case MilestoneCategory.dedication:
        return l10n.milestoneCategoryDedication;
    }
  }
}
