import 'package:hive/hive.dart';

part 'note_model.g.dart'; // generated file

@HiveType(typeId: 0) // Unique typeId for this model
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
