import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/constant/constant.dart';
import '../../models/note_model.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  List<NoteModel>?  notes;
  bool selectDart = true;
  bool isEnglish = false;
  Locale language = const Locale('ar', 'EG');


  changeTheme () {
    if(selectDart == true){
      selectDart = false;
    }else{
     selectDart = true;
    }
    emit(ChangeTheme());
  }


  fetchAllNotes () async {
      final notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());

  }


  void changeLanguage(bool value) {
    isEnglish = value;

    if (value) {
      language = const Locale('en', 'US');
    } else {
      language = const Locale('ar', 'EG');
    }

    emit(ChangeLanguageSuccess(language: language));
  }
}
