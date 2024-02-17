// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogModelAdapter extends TypeAdapter<DogModel> {
  @override
  final int typeId = 2;

  @override
  DogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogModel(
      id: fields[0] as String,
      name: fields[1] as String,
      age: fields[2] as String,
      isMale: fields[3] as bool,
      image: fields[4] as String,
      weight: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DogModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.isMale)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
