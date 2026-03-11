

import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/constant/constant.dart';
import '../../models/alarm_model.dart';

part 'add_alarm_state.dart';

class AddAlarmCubit extends Cubit<AddAlarmState> {
  AddAlarmCubit() : super(AddAlarmInitial());


  static AddAlarmCubit get(context) => BlocProvider.of(context);

  Color? color = Color(0xffAC3931) ;
  addAlarm(AlarmModel alarm) async
  {
    alarm.color = color!.value;
    emit(AddAlarmLoading());
    try {
      final notesBox = Hive.box<AlarmModel>(kAlarmBox);
      await notesBox.add(alarm);
      emit(AddAlarmSuccess());
    } catch (e) {
      emit(AddAlarmFailure(errorMessage: e.toString()));
    }
  }
}
