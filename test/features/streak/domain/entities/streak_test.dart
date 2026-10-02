import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

void main() {
  group('Streak Entity', () {
    test('supports value equality and default values', () {
      final now = DateTime(2026, 10, 2);
      final streak1 = Streak(
        currentCount: 5,
        longestCount: 10,
        lastCheckInDate: now,
        mode: StreakMode.strict,
        forgivenessUsedThisWeek: false,
      );

      final streak2 = Streak(
        currentCount: 5,
        longestCount: 10,
        lastCheckInDate: now,
        mode: StreakMode.strict,
        forgivenessUsedThisWeek: false,
      );

      expect(streak1, equals(streak2));
      expect(streak1.currentCount, 5);
      expect(streak1.mode, StreakMode.strict);
      expect(streak1.forgivenessUsedThisWeek, isFalse);
    });

    test('supports default forgivenessUsedThisWeek as false', () {
      const streak = Streak(
        currentCount: 0,
        longestCount: 0,
        lastCheckInDate: null,
        mode: StreakMode.strict,
      );
      expect(streak.forgivenessUsedThisWeek, isFalse);
    });
  });
}
