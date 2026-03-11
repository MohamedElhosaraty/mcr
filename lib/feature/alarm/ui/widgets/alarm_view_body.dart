import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcr/feature/alarm/ui/widgets/alarm_list_view.dart';
import '../../../../core/localization/localization_methods.dart';
import '../../../note/cubits/notes_cubit/notes_cubit.dart';
import '../../../note/ui/widgets/custom_app_bar.dart';


class AlarmViewBody extends StatelessWidget {
  const AlarmViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            CustomAppBar(
              twoIcon: false,
              title: tr(context, "alarm"),
              icon: Icons.mode_night_outlined,
              onPressed: (){
                NotesCubit.get(context).changeTheme();
              },
            ),
            10.verticalSpace,
            const AlarmListView()
          ],
        ),
      ),
    );
  }
}
