// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      Product_Uniqueid: fields[0] as String,
      Product_name: fields[1] as String,
      Product_description: fields[2] as String,
      Product_imageurl: (fields[3] as List).cast<String>(),
      Product_color_available: (fields[4] as List).cast<dynamic>(),
      Product_size_n_price: (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList(),
      Product_type: (fields[7] as List).cast<String>(),
      Product_reviews: (fields[6] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.Product_Uniqueid)
      ..writeByte(1)
      ..write(obj.Product_name)
      ..writeByte(2)
      ..write(obj.Product_description)
      ..writeByte(3)
      ..write(obj.Product_imageurl)
      ..writeByte(4)
      ..write(obj.Product_color_available)
      ..writeByte(5)
      ..write(obj.Product_size_n_price)
      ..writeByte(6)
      ..write(obj.Product_reviews)
      ..writeByte(7)
      ..write(obj.Product_type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
