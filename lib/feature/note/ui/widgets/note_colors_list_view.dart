import 'package:flutter/material.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../../../core/widgets/color_item.dart';

class NoteColorsListView extends StatefulWidget {
  const NoteColorsListView({super.key});

  @override
  State<NoteColorsListView> createState() => _NoteColorsListViewState();
}

class _NoteColorsListViewState extends State<NoteColorsListView> {
  int currentIndex = 0;
  List<Color> colors =
      const [
        Color(0xffAC3931),
        Color(0xffE5D352),
        Color(0xff91d32c),
        Color(0xff1fe0a5),
        Color(0xff3873c7),
        Color(0xffb335ca),
        Color(0xffD9E76C),
        Color(0xff537D8D),
        Color(0xff482C3D),
        Color(0xffaf6350),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: (){
                currentIndex = index ;
                AddNoteCubit.get(context).color = colors[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
