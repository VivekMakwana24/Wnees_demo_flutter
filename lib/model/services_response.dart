import 'package:json_annotation/json_annotation.dart';

part 'services_response.g.dart';

@JsonSerializable(nullable: true)
class ServicesResponse {
  ServicesResponse({
    this.tag,
    this.entertainer,
  });

  List<Tag>? tag;

  List<Entertainer>? entertainer;

  static fromJson(Map<String, dynamic> json) =>
      _$ServicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}

@JsonSerializable(nullable: true)
class Entertainer {
  Entertainer({
    this.id,
    this.service,
    this.profileImage,
    this.fullName,
    this.avgRating,
    this.verificationBadge,
    this.entertainmentType,
    this.perDayPrice,
    this.perHourPrice,
    this.isFavorite,
    this.totalRating,
    this.categoryTags,
  });

  int? id;
  String? service;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "full_name")
  String? fullName;
  @JsonKey(name: "avg_rating")
  String? avgRating;
  @JsonKey(name: "verification_badge")
  String? verificationBadge;
  @JsonKey(name: "entertainment_type")
  String? entertainmentType;
  @JsonKey(name: "per_day_price")
  int? perDayPrice;
  @JsonKey(name: "per_hour_price")
  int? perHourPrice;
  @JsonKey(name: "is_favorite")
  int? isFavorite;
  @JsonKey(name: "total_rating")
  int? totalRating;
  @JsonKey(name: "category_tags")
  String? categoryTags;

  static fromJson(Map<String?, dynamic> json) => _$EntertainerFromJson(json);

  Map<String?, dynamic> toJson() => _$EntertainerToJson(this);
}

@JsonSerializable(nullable: true)
class Tag {
  Tag({
    this.id,
    this.serviceCategoryId,
    this.enName,
    this.arName,
    this.status,
    this.insertdate,
    this.name,
    this.isSelected
  });

  int? id;
  @JsonKey(name: "service_category_id")
  int? serviceCategoryId;
  String? enName;
  String? arName;
  String? status;
  String? insertdate;
  String? name;
  bool? isSelected;

  static fromJson(Map<String?, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
