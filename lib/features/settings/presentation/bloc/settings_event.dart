part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class LocaleChanged extends SettingsEvent {
  final Locale locale;

  LocaleChanged(this.locale);
}

class LoadSettings extends SettingsEvent {}