// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotesAdapter extends TypeAdapter<Quotes> {
  @override
  final int typeId = 2;

  @override
  Quotes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Quotes()
      .._name = fields[1] as String?
      .._price = fields[2] as double?
      .._percentChange24h = fields[3] as double?
      .._percentChange7d = fields[4] as double?
      .._percentChange30d = fields[5] as double?
      .._percentChange60d = fields[6] as double?
      .._marketCapByTotalSupply = fields[7] as double?;
  }

  @override
  void write(BinaryWriter writer, Quotes obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._price)
      ..writeByte(3)
      ..write(obj._percentChange24h)
      ..writeByte(4)
      ..write(obj._percentChange7d)
      ..writeByte(5)
      ..write(obj._percentChange30d)
      ..writeByte(6)
      ..write(obj._percentChange60d)
      ..writeByte(7)
      ..write(obj._marketCapByTotalSupply);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
