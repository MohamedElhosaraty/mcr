import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/localization_methods.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_search.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
             CustomAppBar(
               twoIcon:  true,
              title: tr(context, "notes"),
              icon: Icons.search,
              onPressed: (){
                 showSearch(context: context,
                     delegate: CustomSearch(noteModel: NotesCubit.get(context).notes!),
                 );
              },
               icon2: Icons.mode_night_outlined,
              onPressed2: (){
                NotesCubit.get(context).changeTheme();
              },
            ),
            10.verticalSpace,
            const NotesListView()
          ],
        ),
      ),
    );
  }
}
