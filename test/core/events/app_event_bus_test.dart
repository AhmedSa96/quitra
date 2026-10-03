import 'package:flutter_test/flutter_test.dart';
import 'package:quitra/core/events/app_event_bus.dart';

void main() {
  late AppEventBus bus;

  setUp(() {
    bus = AppEventBus();
  });

  tearDown(() {
    bus.dispose();
  });

  test('emits and receives events via stream', () async {
    const event = CheckInUpdatedEvent(wasSmoked: false);

    expectLater(bus.stream, emits(event));
    bus.emit(event);
  });

  test('filters events correctly with on<T>()', () async {
    const checkInEvent = CheckInUpdatedEvent(wasSmoked: true);
    final noteEvent = NoteAddedEvent(date: DateTime(2026, 10, 3));

    expectLater(bus.on<CheckInUpdatedEvent>(), emits(checkInEvent));
    bus.emit(noteEvent);
    bus.emit(checkInEvent);
  });
}
