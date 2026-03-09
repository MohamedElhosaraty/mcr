import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcr/core/theming/app_colors.dart';
import 'package:mcr/core/theming/app_text_styles.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import '../page/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes, });

  final NoteModel notes ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  EditNoteView(note: notes,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(notes.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notes.title,
                style: AppTextStyles.font26Bold(context).copyWith(
                  color: AppColors.black
                )
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  notes.subTitle,
                  style: AppTextStyles.font20Bold(context).copyWith(
                    color: AppColors.black.withOpacity(.6),
                  )
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  notes.delete();
                  NotesCubit.get(context).fetchAllNotes();
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
                notes.data,
                style: TextStyle(
                    color: Colors.black.withOpacity(.4), fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
