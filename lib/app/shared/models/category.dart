import 'dart:convert';

class Category {
  int? id;
  final String name;

  Category({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      name: map['name'] as String,
    );
  }

  toJson() {
    return json.encode(toMap());
  }



  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }
}
