import 'package:data_json_formatting/model/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

// Manual parsing
// class Data {
//   final String type;
//   final List<Person> people;
//
//   Data._({
//     required this.type,
//     required this.people
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     List<dynamic> list = json['data'];
//     List<Person> peopleList = list
//       .map((personObj) => Person.fromJson(personObj))
//       .toList();
//
//     return Data._(
//       type: json['type'],
//       people: peopleList
//     );
//
//   }
// }

// Automatic parsing
@JsonSerializable(explicitToJson: true)
class Data {
  final String type;
  final List<Person> data;
  Data(this.type, this.data);

  factory Data.fromJson(Map<String, dynamic> json)
      => _$DataFromJson(json);

  Map<String, dynamic> toJson()
      => _$DataToJson(this);
}