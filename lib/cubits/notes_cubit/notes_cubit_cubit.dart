import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/core/utils/constants.dart';
import '../../models/note_model.dart';
part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());
  List<NoteModel>? notes;
  getAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesCubitSuccess());
  }
}
