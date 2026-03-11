
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mcr/core/constant/constant.dart';
import 'package:mcr/feature/alarm/models/alarm_model.dart';

part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());

  static AlarmCubit get(context) => BlocProvider.of(context);

  List<AlarmModel>?  alarms;

  fetchAllAlarms () async {
    final alarmBox = Hive.box<AlarmModel>(kAlarmBox);
    alarms = alarmBox.values.toList();
    emit(AlarmSuccess());

  }



}
