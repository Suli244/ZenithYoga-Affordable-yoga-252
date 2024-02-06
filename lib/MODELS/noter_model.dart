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

  LoganXManChelovek({
    required this.noteType,
    required this.mnogoTexta,
    required this.dateTime,
  });

  @override
  String toString() => 'LoganXManChelovek(noteType: $noteType, mnogoTexta: $mnogoTexta, dateTime: $dateTime)';
}

@HiveType(typeId: 2)
enum NoteType {
  @HiveField(0)
  Yoga,
  @HiveField(1)
  Meditation,
}
