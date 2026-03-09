import 'package:flutter/material.dart';

import '../../models/note_model.dart';
import 'filter_search_list_view.dart';
import 'notes_list_view.dart';

class CustomSearch extends SearchDelegate {
  final List<NoteModel> noteModel;
  List? filterTitle;

  CustomSearch(
      {
      required this.noteModel
      });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query == "") {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: const Column(
          children: [
            NotesListView(),
          ],
        ),
      );
    }else{
      filterTitle = noteModel.where((element) => element.title.startsWith(query),).toList();
      return  Column(
        children: [
          FilterSearchListView(filterListTitle: filterTitle,),
        ],
      );
    }
  }
}
