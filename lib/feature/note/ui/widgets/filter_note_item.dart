import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import '../page/edit_note_view.dart';

class FilterNoteItem extends StatelessWidget {
  const FilterNoteItem({super.key, required this.filterNotes, });

  final NoteModel filterNotes ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  EditNoteView(note: filterNotes,),
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
          color: Color(filterNotes.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                filterNotes.title,
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  filterNotes.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 18.sp,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  filterNotes.delete();
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
                filterNotes.data,
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
