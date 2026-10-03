import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/features/journey/data/models/journal_note_isar.dart';

void main() {
  test('JournalNoteIsar has required fields and instantiates correctly', () {
    final note = JournalNoteIsar()
      ..date = DateTime(2026, 10, 3)
      ..createdAt = DateTime(2026, 10, 3, 14, 30)
      ..text = 'Test reflection';
    expect(note.text, 'Test reflection');
    expect(note.date, DateTime(2026, 10, 3));
    expect(note.createdAt, DateTime(2026, 10, 3, 14, 30));
  });
}
