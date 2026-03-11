import 'package:flutter/material.dart';
import 'package:mcr/feature/alarm/ui/widgets/add_alarm_bottom_sheet.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/alarm_view_body.dart';


class AlarmView extends StatelessWidget {
  const AlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AlarmViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              context: context, builder: (context) {
            return const AddAlarmBottomSheet();
          });
        },
        child:  Icon(Icons.add,size: 30,color: AppColors.background,),
      ),
    );
  }
}
