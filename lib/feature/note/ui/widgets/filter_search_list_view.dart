import 'package:flutter/material.dart';

import 'filter_note_item.dart';

class FilterSearchListView extends StatelessWidget {
  const FilterSearchListView({super.key, required this.filterListTitle});

  final List? filterListTitle;


  @override
  Widget build(BuildContext context) {
    return Expanded(
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 10),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filterListTitle?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: FilterNoteItem(filterNotes: filterListTitle?[index],),
                );
              },
            ),
      ),
    );
  }
}
