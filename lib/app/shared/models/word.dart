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
      image: map['image'],
      level: map['level'] != null ? map['level'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) =>
      Word.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Word.empty() {
    return Word(
      id: null,
      category: '',
      key: '',
      value: '',
      image: '',
      level: null,
    );
  }

  @override
  String toString() {
    return 'Word(id: $id, category: $category, key: $key, value: $value, image: $image, level: $level)';
  }
}
