import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcr/feature/alarm/cubit/add_alarm_cubit/add_alarm_cubit.dart';
import 'package:mcr/feature/alarm/ui/widgets/add_alarm_form.dart';

import '../../cubit/alarm_cubit.dart';

class AddAlarmBottomSheet extends StatelessWidget {
  const AddAlarmBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAlarmCubit(),
      child: BlocConsumer<AddAlarmCubit, AddAlarmState>(
        listener: (context, state) {
          if (state is AddAlarmFailure) {
            debugPrint("Failure ${state.errorMessage.toString()}");
          }
          if (state is AddAlarmSuccess) {
            AlarmCubit.get(context).fetchAllAlarms();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          // بستخدمها عندما انا مش عاوز المستخدم يتعامل مع اى حاجة فى الشاشه عند عمل ال Loading
          return  AbsorbPointer(
            absorbing: state is AddAlarmLoading ? true : false ,
            child:  Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                // عند استخدام الكيبورد يعمل مساحة من تحت
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(child: AddAlarmForm()),
            ),
          );
        },
      ),
    );
  }
}
