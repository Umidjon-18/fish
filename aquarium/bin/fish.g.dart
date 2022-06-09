// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FishAdapter extends TypeAdapter<Fish> {
  @override
  final int typeId = 1;

  @override
  Fish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fish(
      type: fields[0] as String,
      lifeTime: fields[1] as int,
      parent: fields[2] as String,
    )
      ..birthday = fields[3] as String
      ..oportunity = fields[4] as int
      ..population = (fields[5] as List)
          ?.map((dynamic e) => (e as Map)?.cast<dynamic, dynamic>())
          ?.toList()
      ..reasonDead = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, Fish obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.lifeTime)
      ..writeByte(2)
      ..write(obj.parent)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.oportunity)
      ..writeByte(5)
      ..write(obj.population)
      ..writeByte(6)
      ..write(obj.reasonDead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
