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
      fields[0] as FishType,
      fields[1] as int,
      fields[2] as int,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as List
    )
      ..oportunity = fields[2] as int
      ..reasonDead = fields[3] as String
      ..birthday = fields[4] as String
      ..parent = fields[5] as String
      ..population = (fields[6] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList();
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
      ..write(obj.oportunity)
      ..writeByte(3)
      ..write(obj.reasonDead)
      ..writeByte(4)
      ..write(obj.birthday)
      ..writeByte(5)
      ..write(obj.parent)
      ..writeByte(6)
      ..write(obj.population);
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
