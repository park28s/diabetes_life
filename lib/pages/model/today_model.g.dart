// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodayModelAdapter extends TypeAdapter<TodayModel> {
  @override
  final int typeId = 2;

  @override
  TodayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodayModel(
      dayDiabetesEmptyStomach: fields[0] as int?,
      dayDiabetesBeforeMeal: fields[1] as int?,
      dayDiabetesAfterMeal: fields[2] as int?,
      dayBloodPressure1: fields[3] as int?,
      dayBloodPressure2: fields[4] as int?,
      dayBadFood: fields[5] as int?,
      dayHealth: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TodayModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.dayDiabetesEmptyStomach)
      ..writeByte(1)
      ..write(obj.dayDiabetesBeforeMeal)
      ..writeByte(2)
      ..write(obj.dayDiabetesAfterMeal)
      ..writeByte(3)
      ..write(obj.dayBloodPressure1)
      ..writeByte(4)
      ..write(obj.dayBloodPressure2)
      ..writeByte(5)
      ..write(obj.dayBadFood)
      ..writeByte(6)
      ..write(obj.dayHealth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
