// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CryptoDataAdapter extends TypeAdapter<CryptoData> {
  @override
  final int typeId = 1;

  @override
  CryptoData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CryptoData()
      .._id = fields[1] as int?
      .._name = fields[2] as String?
      .._symbol = fields[3] as String?
      .._circulatingSupply = fields[4] as double?
      .._quotes = (fields[5] as List?)?.cast<Quotes>()
      ..isMark = fields[6] as bool;
  }

  @override
  void write(BinaryWriter writer, CryptoData obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj._id)
      ..writeByte(2)
      ..write(obj._name)
      ..writeByte(3)
      ..write(obj._symbol)
      ..writeByte(4)
      ..write(obj._circulatingSupply)
      ..writeByte(5)
      ..write(obj._quotes)
      ..writeByte(6)
      ..write(obj.isMark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CryptoDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
