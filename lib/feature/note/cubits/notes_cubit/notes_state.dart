part of 'notes_cubit.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {}

final class ChangeTheme extends NotesState {}

final class ChangeLanguageSuccess extends NotesState {
  final Locale language;

  ChangeLanguageSuccess({required this.language});
}


