import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

// Manual parsing
// class Person {
//   final int id;
//   final String value;
//
//   Person._({required this.id, required this.value});
//
//   factory Person.fromJson(Map<String, dynamic> json) =>
//       Person._(id: json['id'], value: json['name']);
//
//   Map<String, dynamic> toJson() =>
//       {
//         "id": id,
//         "name": value
//       };
//
//   @override
//   String toString() => 'id: $id - name: $value';
// }

// Automatic Parsing
@JsonSerializable()
class Person {
  final int id;
  final String name;
  Person(this.id, this.name);

  factory Person.fromJson(Map<String, dynamic> json)
      => _$PersonFromJson(json);

  Map<String, dynamic> toJson()
      => _$PersonToJson(this);

  @override
  String toString() => 'id: $id - name: $name';
}
