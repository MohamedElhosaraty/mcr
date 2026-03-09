import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBar(
                  twoIcon: false,
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subTitle = content ?? widget.note.subTitle;
                    widget.note.save();
                    NotesCubit.get(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                  title: "Edit Note",
                  icon: Icons.check,
                ),
                50.verticalSpace,
                CustomTextField(
                    selectDart: NotesCubit.get(context).selectDart,

                    onChanged: (value) {
                      title = value;
                    },
                    hint: widget.note.title),
                16.verticalSpace,
                CustomTextField(
                  selectDart: NotesCubit.get(context).selectDart,

                  onChanged: (value) {
                    content = value;
                  },
                  hint: widget.note.subTitle, maxLines: 5,),

              ],
            );
          },
        ),
      ),
    );
  }
}
