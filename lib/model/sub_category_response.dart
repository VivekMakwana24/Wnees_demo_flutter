import 'package:json_annotation/json_annotation.dart';

part 'sub_category_response.g.dart';

@JsonSerializable(nullable: true)
class SubCategoryResponse {
  SubCategoryResponse({
    this.id,
    this.enName,
    this.arName,
    this.image,
    this.status,
    this.insertdate,
    this.name,
  });

  int? id;
  String? enName;
  String? arName;
  String? image;
  String? status;
  String? insertdate;
  String? name;

  static fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);

}
