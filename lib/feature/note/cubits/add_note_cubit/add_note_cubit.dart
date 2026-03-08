import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/constant/constant.dart';
import '../../models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  Color? color = Color(0xffAC3931) ;
  addNote(NoteModel note) async
  {
    note.color = color!.value;
    emit(AddNoteLoading());
     try {
       final notesBox = Hive.box<NoteModel>(kNotesBox);
       await notesBox.add(note);
       emit(AddNoteSuccess());
     } catch (e) {
       emit(AddNoteFailure(errorMessage: e.toString()));
     }
  }
}
