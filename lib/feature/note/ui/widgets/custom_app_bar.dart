import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';
import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.icon2,
    this.onPressed2,
    required this.twoIcon,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  final IconData? icon2;
  final void Function()? onPressed2;

  final bool twoIcon ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton (
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,size: 30,),
        ),
        Text(
          title,
          style: AppTextStyles.font30Bold(context),
        ),
        Spacer(),
        twoIcon ?
        Row(
          children: [
            CustomSearchIcon(
              onPressed: onPressed2,
              icon: icon2!,
            ),
            10.horizontalSpace,
            CustomSearchIcon(
              onPressed: onPressed,
              icon: icon,
            ),
          ],
        ):
        CustomSearchIcon(
          onPressed: onPressed,
          icon: icon,
        ),

      ],
    );
  }
}
