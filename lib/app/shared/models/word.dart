// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Word {
  int? id;
  final String category;
  final String key;
  final String value;
  final String image;
  final int? level;
  Word({
    this.id,
    required this.category,
    required this.key,
    required this.value,
    required this.image,
    this.level,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'category': category,
  //     'key': key,
  //     'level': level,
  //     'value': value,
  //     'image': image,
  //   };
  // }

  // factory Word.fromMap(Map<String, dynamic> map) {
  //   return Word(
  //     id: map['id'] as int?,
  //     category: map['level'] as String,
  //     key: map['key'] as String,
  //     value: map['value'] as String,
  //     image: map['image'] as String,
  //     level: map['level'] as int,
  //   );
  // }

  Word copyWith({
    int? id,
    String? category,
    String? key,
    String? value,
    String? image,
    int? level,
  }) {
    return Word(
      id: id ?? this.id,
      category: category ?? this.category,
      key: key ?? this.key,
      value: value ?? this.value,
      image: image ?? this.image,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'key': key,
      'value': value,
      'image': image,
      'level': level,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      id: map['id'] != null ? map['id'] as int : null,
      category: map['category'] as String,
      key: map['key'] as String,
      value: map['value'] as String,
      image: map['image'] as String,
      level: map['level'] != null ? map['level'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) =>
      Word.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Word(id: $id, category: $category, key: $key, value: $value, image: $image, level: $level)';
  }

  @override
  bool operator ==(covariant Word other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.category == category &&
        other.key == key &&
        other.value == value &&
        other.image == image &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        key.hashCode ^
        value.hashCode ^
        image.hashCode ^
        level.hashCode;
  }
}
