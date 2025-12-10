import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  static const id = 'EditNoteView';
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(text: 'Edit Note', fontSize: 25),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            hint: 'Title',
            onChanged: (value) {
              title = value;
            },
          ),
          CustomTextFormField(
            hint: 'Description',
            onChanged: (value) {
              subTitle = value;
            },
            maxLines: 10,
          ),
          CustomButton(
            text: 'Save',
            ontap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).getAllNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
