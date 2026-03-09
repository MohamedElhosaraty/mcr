import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotesViewBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              context: context, builder: (context) {
            return const AddNoteBottomSheet();
          });
        },
        child:  Icon(Icons.add,size: 30,color: AppColors.background,),
      ),
    );
  }
}
