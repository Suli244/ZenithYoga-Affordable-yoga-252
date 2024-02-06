// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoganXManChelovekAdapter extends TypeAdapter<LoganXManChelovek> {
  @override
  final int typeId = 1;

  @override
  LoganXManChelovek read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoganXManChelovek(
      noteType: fields[0] as NoteType,
      mnogoTexta: fields[1] as String,
      dateTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LoganXManChelovek obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.noteType)
      ..writeByte(1)
      ..write(obj.mnogoTexta)
      ..writeByte(2)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoganXManChelovekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteTypeAdapter extends TypeAdapter<NoteType> {
  @override
  final int typeId = 2;

  @override
  NoteType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteType.Yoga;
      case 1:
        return NoteType.Meditation;
      default:
        return NoteType.Yoga;
    }
  }

  @override
  void write(BinaryWriter writer, NoteType obj) {
    switch (obj) {
      case NoteType.Yoga:
        writer.writeByte(0);
        break;
      case NoteType.Meditation:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
