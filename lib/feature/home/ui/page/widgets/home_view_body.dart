import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcr/core/localization/localization_methods.dart';
import 'package:mcr/core/widgets/custom_button.dart';

import '../../../../../core/routing/routes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.notesView);
            },
          text: tr(context, "memory"),),
          30.verticalSpace,
          CustomButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.alarmView);
            },text: tr(context, "alarm"),),
          30.verticalSpace,
          CustomButton(onPressed: (){},text: tr(context, "chat"),),
          ]
      ),
    );
  }
}
