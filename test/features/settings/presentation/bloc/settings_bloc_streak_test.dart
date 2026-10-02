import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:quitra/features/streak/domain/entities/streak.dart';

void main() {
  test('SettingsState supports streakMode and streakRemindersEnabled', () {
    const state = SettingsState(
      streakMode: StreakMode.forgiving,
      streakRemindersEnabled: true,
    );
    expect(state.streakMode, StreakMode.forgiving);
    expect(state.streakRemindersEnabled, isTrue);

    final updated = state.copyWith(streakMode: StreakMode.strict, streakRemindersEnabled: false);
    expect(updated.streakMode, StreakMode.strict);
    expect(updated.streakRemindersEnabled, isFalse);
  });
}
