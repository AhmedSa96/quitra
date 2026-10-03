import 'package:isar/isar.dart';

part 'journal_note_isar.g.dart';

@collection
class JournalNoteIsar {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  late DateTime createdAt;

  late String text;
}
