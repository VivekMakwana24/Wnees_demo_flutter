// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) {
  return ServicesResponse(
    tag: (json['tag'] as List)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList().cast<Tag>(),
    entertainer: (json['entertainer'] as List)
        .map((e) => Entertainer.fromJson(e as Map<String, dynamic>))
        .toList().cast<Entertainer>(),
  );
}

Map<String, dynamic> _$ServicesResponseToJson(ServicesResponse instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'entertainer': instance.entertainer,
    };

Entertainer _$EntertainerFromJson(Map<String?, dynamic> json) {
  return Entertainer(
    id: json['id'] as int?,
    service: json['service'] as String?,
    profileImage: json['profile_image'] as String?,
    fullName: json['full_name'] as String?,
    avgRating: json['avg_rating'] as String?,
    verificationBadge: json['verification_badge'] as String?,
    entertainmentType: json['entertainment_type'] as String?,
    perDayPrice: json['per_day_price'] as int?,
    perHourPrice: json['per_hour_price'] as int?,
    isFavorite: json['is_favorite'] as int?,
    totalRating: json['total_rating'] as int?,
    categoryTags: json['category_tags'] as String?,
  );
}

Map<String, dynamic> _$EntertainerToJson(Entertainer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'profile_image': instance.profileImage,
      'full_name': instance.fullName,
      'avg_rating': instance.avgRating,
      'verification_badge': instance.verificationBadge,
      'entertainment_type': instance.entertainmentType,
      'per_day_price': instance.perDayPrice,
      'per_hour_price': instance.perHourPrice,
      'is_favorite': instance.isFavorite,
      'total_rating': instance.totalRating,
      'category_tags': instance.categoryTags,
    };

Tag _$TagFromJson(Map<String?, dynamic> json) {
  return Tag(
    id: json['id'] as int?,
    serviceCategoryId: json['service_category_id'] as int?,
    enName: json['enName'] as String?,
    arName: json['arName'] as String?,
    status: json['status'] as String?,
    insertdate: json['insertdate'] as String?,
    name: json['name'] as String?,
    isSelected: json['isSelected'] as bool?,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'service_category_id': instance.serviceCategoryId,
      'enName': instance.enName,
      'arName': instance.arName,
      'status': instance.status,
      'insertdate': instance.insertdate,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };
