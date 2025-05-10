import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:mobile_shop/hive_helper/hive_types.dart';
import 'package:mobile_shop/hive_helper/hive_adapters.dart';
import 'package:mobile_shop/hive_helper/fields/category_model_fields.dart';


part 'category_model.g.dart';


@HiveType(typeId: HiveTypes.categoryModel, adapterName: HiveAdapters.categoryModel)
class CategoryModel extends HiveObject{
	@HiveField(CategoryModelFields.id)
  final int? id;
	@HiveField(CategoryModelFields.name)
  final String? name;
	@HiveField(CategoryModelFields.icon)
  final String? icon;

  CategoryModel({
    this.name,
    this.icon,
    this.id
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': icon,
      'id': id
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] != null ? map['name'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(id: $id, name: $name, image: $icon)';
}