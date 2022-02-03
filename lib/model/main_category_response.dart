import 'package:json_annotation/json_annotation.dart';

part 'main_category_response.g.dart';

@JsonSerializable(nullable: true)
class MainCategoryResponse {
  MainCategoryResponse({
    this.id,
    this.enName,
    this.arName,
    this.image,
    this.status,
    this.type,
    this.city,
    this.insertdate,
    this.name,
  });

  static fromJson(Map<String?, dynamic> json) =>
      _$MainCategoryResponseFromJson(json);

  Map<String?, dynamic> toJson() => _$MainCategoryResponseToJson(this);

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "en_name")
  String? enName;
  @JsonKey(name: "ar_name")
  String? arName;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "insertdate")
  String? insertdate;
  @JsonKey(name: "name")
  String? name;
}
