import 'package:hive_flutter/hive_flutter.dart';

part 'noter_model.g.dart';

@HiveType(typeId: 1)
class LoganXManChelovek {
  @HiveField(0)
  final NoteType noteType;

  @HiveField(1)
  final String mnogoTexta;

  @HiveField(2)
  final DateTime dateTime;

  @HiveField(3)
  final String? group;

  @HiveField(4)
  final String? mainImage;

  LoganXManChelovek({
    required this.noteType,
    required this.mnogoTexta,
    required this.dateTime,
    this.mainImage,
    this.group,
  });

  @override
  String toString() =>
      'LoganXManChelovek(noteType: $noteType, mnogoTexta: $mnogoTexta, dateTime: $dateTime, mainImage: $mainImage, group: $group)';
}

@HiveType(typeId: 2)
enum NoteType {
  @HiveField(0)
  Yoga,
  @HiveField(1)
  Meditation,
}
