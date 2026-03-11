import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mcr/core/localization/localization_methods.dart';
import 'package:mcr/feature/alarm/ui/widgets/alarm_color_list_view.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../note/cubits/add_note_cubit/add_note_cubit.dart';
import '../../../note/cubits/notes_cubit/notes_cubit.dart';
import '../../cubit/add_alarm_cubit/add_alarm_cubit.dart';
import '../../models/alarm_model.dart';
import '../../service/local_notification_service.dart';

class AddAlarmForm extends StatefulWidget {
  const AddAlarmForm({super.key});

  @override
  State<AddAlarmForm> createState() => _AddAlarmFormState();
}

class _AddAlarmFormState extends State<AddAlarmForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  int? hours, days;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return Column(
            children: [
              32.verticalSpace,
              CustomTextField(
                selectDart: NotesCubit.get(context).selectDart,
                onSaved: (value) {
                  title = value;
                },
                hint: tr(context, "treatment"),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Text(
                    tr(context, "addAlarm"),
                    style: AppTextStyles.font20Bold(context).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      selectDart: NotesCubit.get(context).selectDart,
                      onSaved: (value) {
                        hours = int.parse(value!);
                      },
                      hint: tr(context, "addAlarm"),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Text(
                    tr(context, "addDays"),
                    style: AppTextStyles.font20Bold(context).copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      selectDart: NotesCubit.get(context).selectDart,
                      onSaved: (value) {
                        days = int.parse(value!);
                      },
                      hint: tr(context, "addDays"),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              const AlarmColorListView(),
              20.verticalSpace,
              BlocBuilder<AddAlarmCubit, AddAlarmState>(
                builder: (context, state) {
                  return state is AddNoteLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : CustomButton(
                    yPadding: 12,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        final currentDate = DateTime.now();
                        final formatedCurrentDate =
                        DateFormat('dd/MM/yyyy').format(
                            currentDate .add(Duration(days: days!)));
                        final alarmModel = AlarmModel(
                          title: title!,
                          color: Colors.blue.value,
                           hours: hours!,
                           data: formatedCurrentDate,
                        );
                        AddAlarmCubit.get(context).addAlarm(alarmModel);
                        LocalNotificationService.scheduleMedicineNotifications(
                          medicineName: title!,
                          hoursInterval: hours!,
                          durationDays: days!,
                          context: context,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: tr(context, "addAlarm"),
                  );
                },
              ),
              16.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
