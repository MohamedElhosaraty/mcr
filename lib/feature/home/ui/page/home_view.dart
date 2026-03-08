import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcr/core/localization/localization_methods.dart';
import 'package:mcr/core/theming/app_colors.dart';
import 'package:mcr/core/theming/app_text_styles.dart';
import '../../../note/cubits/notes_cubit/notes_cubit.dart';
import '../../../note/ui/widgets/custom_search_icon.dart';
import 'widgets/home_view_body.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding:  const EdgeInsets.only(right: 10 ,left: 10),
        actions: [
          Switch(
            activeColor: AppColors.primaryColor,
            value: NotesCubit.get(context).isEnglish,
            onChanged: (value) {
              NotesCubit.get(context).changeLanguage(value);
            },
          ),
         10.horizontalSpace,
         CustomSearchIcon(
            icon: Icons.mode_night_outlined,
            onPressed: (){
              NotesCubit.get(context).changeTheme();
            },
          )
        ],
        title: Text(tr(context, "medicare remender"),style:
          AppTextStyles.font23Bold(context),),
      ),
      body: HomeViewBody(),

    );
  }
}
