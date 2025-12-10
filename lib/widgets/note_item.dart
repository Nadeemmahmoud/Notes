import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_text.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: note);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kPrimaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: CustomText(text: note.title, fontSize: 30),
                subtitle: CustomText(
                  text: note.subTitle,
                  fontSize: 18,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(
                      context,
                    ).getAllNotes();
                  },
                  icon: Icon(Icons.delete, size: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomText(text: note.date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
