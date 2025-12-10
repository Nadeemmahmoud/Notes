import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/utils/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_cubit.dart';
import 'package:notes_app/widgets/custom_text.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
import '../widgets/add_note_bottom_sheet.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});
  static const id = 'HomePage';

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomText(text: 'Notes', fontSize: 30),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.all(16),
            onPressed: () {},
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: Icon(Icons.add),
      ),

      body: NotesListView(),
      
    );
  }
}
