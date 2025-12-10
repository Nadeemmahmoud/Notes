import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        onChanged: onChanged,
        maxLines: maxLines,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: kPrimaryColor),
          border: outlineBorder(),
          enabledBorder: outlineBorder(),
          focusedBorder: outlineBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: kPrimaryColor),
    );
  }
}
