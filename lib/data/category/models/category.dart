import 'dart:convert';

class CategoryModel {
  final int? id;
  final String? name;
  final String? icon;

  CategoryModel({
    this.name,
    this.icon,
    this.id
  });

  CategoryModel copyWith({
    String? name,
    String? icon,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

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

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
