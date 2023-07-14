// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'park.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParkAdapter extends TypeAdapter<Park> {
  @override
  final int typeId = 0;

  @override
  Park read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Park()
      ..ad = fields[0] as String?
      ..fotoUrl = fields[1] as String?
      ..kapasite = fields[2] as int?
      ..latitude = fields[3] as String?
      ..longitude = fields[4] as int?
      ..saticiId = fields[5] as String?
      ..ucret = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, Park obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.ad)
      ..writeByte(1)
      ..write(obj.fotoUrl)
      ..writeByte(2)
      ..write(obj.kapasite)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.saticiId)
      ..writeByte(6)
      ..write(obj.ucret);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
