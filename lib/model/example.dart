import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
  final int total;
  @JsonKey(defaultValue: [])
  final List<String> values;
  Example(this.total, this.values);

  factory Example.fromJson(Map<String, dynamic> json)
      => _$ExampleFromJson(json);

  Map<String, dynamic> toJson()
      => _$ExampleToJson(this);
}