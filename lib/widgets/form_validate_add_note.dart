import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'custom_text_field.dart';

class FormValidateAddNote extends StatefulWidget {
  const FormValidateAddNote({super.key});

  @override
  State<FormValidateAddNote> createState() =>
      _FormValidateAddNoteState();
}

class _FormValidateAddNoteState extends State<FormValidateAddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          CustomTextFormField(
            hint: 'Description',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,

                text: 'Add',
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var formattedDate = DateFormat(
                      'yyyy-MM-dd HH:mm',
                    ).format(DateTime.now());
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedDate,

                      color: Colors.black.value,
                    );
                    BlocProvider.of<AddNoteCubit>(
                      context,
                    ).addNote(noteModel);
                  } else {
                    setState(
                      () =>
                          autovalidateMode = AutovalidateMode.always,
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
