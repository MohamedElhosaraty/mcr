import 'package:flutter/material.dart';

import '../constant/constant.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    required this.selectDart,
  });

  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool selectDart;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hint,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(
            kPrimaryColor,
          )),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color:  selectDart ? Colors.black : Colors.white ));
  }
}
