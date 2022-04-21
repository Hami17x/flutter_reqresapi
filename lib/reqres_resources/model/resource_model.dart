import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
