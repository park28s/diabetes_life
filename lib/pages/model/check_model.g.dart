// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckModelAdapter extends TypeAdapter<CheckModel> {
  @override
  final int typeId = 1;

  @override
  CheckModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckModel(
      diabetesEmptyStomach: fields[0] as int?,
      diabetesBeforeMeal: fields[1] as int?,
      diabetesAfterMeal: fields[2] as int?,
      bloodPressure1: fields[3] as int?,
      bloodPressure2: fields[4] as int?,
      badFood: fields[5] as int?,
      health: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.diabetesEmptyStomach)
      ..writeByte(1)
      ..write(obj.diabetesBeforeMeal)
      ..writeByte(2)
      ..write(obj.diabetesAfterMeal)
      ..writeByte(3)
      ..write(obj.bloodPressure1)
      ..writeByte(4)
      ..write(obj.bloodPressure2)
      ..writeByte(5)
      ..write(obj.badFood)
      ..writeByte(6)
      ..write(obj.health);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
