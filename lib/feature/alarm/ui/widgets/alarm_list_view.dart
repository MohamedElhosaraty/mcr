import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcr/feature/alarm/models/alarm_model.dart';
import 'package:mcr/feature/alarm/ui/widgets/alarm_item.dart';
import '../../cubit/alarm_cubit.dart';

class AlarmListView extends StatelessWidget {
  const AlarmListView({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AlarmCubit, AlarmState>(
        builder: (context, state) {

          List<AlarmModel> alarms = AlarmCubit.get(context).alarms ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: alarms.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: AlarmItem(alarm: alarms[index],),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
