import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcr/core/localization/localization_methods.dart';
import 'package:mcr/core/theming/app_colors.dart';
import 'package:mcr/core/theming/app_text_styles.dart';
import 'package:mcr/feature/alarm/models/alarm_model.dart';
import '../../cubit/alarm_cubit.dart';

class AlarmItem extends StatelessWidget {
  const AlarmItem({super.key, required this.alarm, });

  final AlarmModel alarm ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(alarm.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
                alarm.title,
                style: AppTextStyles.font26Bold(context).copyWith(
                    color: AppColors.black
                )
            ),
            trailing: IconButton(
              onPressed: () {
                alarm.delete();
                AlarmCubit.get(context).fetchAllAlarms();
              },
              icon: Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24.h,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              "${tr(context, "all")}${alarm.hours} ${tr(context, "hour")}",
              style: TextStyle(
                  color: Colors.black.withOpacity(.4), fontSize: 16.sp),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              "${tr(context, "theMedicationExpiresOn")} ${alarm.data} ",
              style: TextStyle(
                  color: Colors.black.withOpacity(.4), fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
