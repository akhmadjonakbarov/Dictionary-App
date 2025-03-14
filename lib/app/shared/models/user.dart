// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String? name;
  final String level;
  final int lvl;
  final String learningLang;

  User(
      {this.name,
      required this.level,
      required this.learningLang,
      required this.lvl});

  factory User.empty() {
    return User(
      name: '',
      level: '',
      learningLang: '',
      lvl: 0,
    );
  }

  User copyWith({
    String? name,
    String? level,
    String? learningLang,
    int? lvl,
  }) {
    return User(
      name: name ?? this.name,
      level: level ?? this.level,
      learningLang: learningLang ?? this.learningLang,
      lvl: lvl ?? this.lvl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'level': level,
      'learningLang': learningLang,
      'lvl': lvl
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      level: map['level'] as String,
      learningLang: map['learningLang'] as String,
      lvl: int.parse(map['lvl'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(name: $name, level: $level, learningLang: $learningLang)';
}
