// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainCategoryResponse _$MainCategoryResponseFromJson(Map<String?, dynamic> json) {
  return MainCategoryResponse(
    id: json['id'] as int?,
    enName: json['en_name'] as String?,
    arName: json['ar_name'] as String?,
    image: json['image'] as String?,
    status: json['status'] as String?,
    type: json['type'] as String?,
    city: json['city'] as String?,
    insertdate: json['insertdate'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$MainCategoryResponseToJson(
        MainCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'en_name': instance.enName,
      'ar_name': instance.arName,
      'image': instance.image,
      'status': instance.status,
      'type': instance.type,
      'city': instance.city,
      'insertdate': instance.insertdate,
      'name': instance.name,
    };
