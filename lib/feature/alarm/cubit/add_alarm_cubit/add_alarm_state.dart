part of 'add_alarm_cubit.dart';

sealed class AddAlarmState {}

final class AddAlarmInitial extends AddAlarmState {}

final class AddAlarmLoading extends AddAlarmState {}

final class AddAlarmSuccess extends AddAlarmState {}

final class AddAlarmFailure extends AddAlarmState {
  final String errorMessage;

  AddAlarmFailure({required this.errorMessage});
}
