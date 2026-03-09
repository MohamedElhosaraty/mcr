import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mcr/core/localization/localization_methods.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_colors_list_view.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return Column(
            children: [
              32.verticalSpace,
              CustomTextField(
                selectDart: NotesCubit.get(context).selectDart,
                onSaved: (value) {
                  title = value;
                },
                hint: tr(context, "title"),
              ),
              16.verticalSpace,
              CustomTextField(
                selectDart: NotesCubit.get(context).selectDart,
                onSaved: (value) {
                  subTitle = value;
                },
                hint: tr(context, "content"),
                maxLines: 5,
              ),
              20.verticalSpace,
              const NoteColorsListView(),
              20.verticalSpace,
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return state is AddNoteLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : CustomButton(
                    yPadding: 12,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        final currentDate = DateTime.now();
                        final formatedCurrentDate =
                        DateFormat.yMd().format(currentDate);

                        final noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          data: formatedCurrentDate,
                          color: Colors.blue.value,
                        );

                        AddNoteCubit.get(context).addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: tr(context, "add note"),
                  );
                },
              ),
              16.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
