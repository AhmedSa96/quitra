import 'dart:async';
import 'package:injectable/injectable.dart';

abstract class AppEvent {
  const AppEvent();
}

class CheckInUpdatedEvent extends AppEvent {
  final bool wasSmoked;
  const CheckInUpdatedEvent({required this.wasSmoked});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckInUpdatedEvent &&
          runtimeType == other.runtimeType &&
          wasSmoked == other.wasSmoked;

  @override
  int get hashCode => wasSmoked.hashCode;
}

class NoteAddedEvent extends AppEvent {
  final DateTime date;
  const NoteAddedEvent({required this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAddedEvent &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;
}

class JourneyDayUpdatedEvent extends AppEvent {
  final DateTime date;
  const JourneyDayUpdatedEvent({required this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JourneyDayUpdatedEvent &&
          runtimeType == other.runtimeType &&
          date == other.date;

  @override
  int get hashCode => date.hashCode;
}

class MilestonesUpdatedEvent extends AppEvent {
  const MilestonesUpdatedEvent();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MilestonesUpdatedEvent && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

@lazySingleton
class AppEventBus {
  final StreamController<AppEvent> _controller =
      StreamController<AppEvent>.broadcast();

  Stream<AppEvent> get stream => _controller.stream;

  Stream<T> on<T extends AppEvent>() {
    return _controller.stream.where((event) => event is T).cast<T>();
  }

  void emit(AppEvent event) {
    if (!_controller.isClosed) {
      _controller.add(event);
    }
  }

  void dispose() {
    _controller.close();
  }
}
