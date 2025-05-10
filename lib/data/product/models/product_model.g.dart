// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      details: fields[2] as String?,
      size: fields[3] as String?,
      colour: fields[4] as String?,
      mainImage: fields[5] as String?,
      price: fields[6] as double?,
      category: fields[7] as CategoryModel?,
      images: (fields[8] as List?)?.cast<String?>(),
      reviews: (fields[9] as List?)?.cast<ReviewModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.colour)
      ..writeByte(5)
      ..write(obj.mainImage)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.images)
      ..writeByte(9)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
