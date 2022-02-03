// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) {
  return SubCategoryResponse(
    id: json['id'] as int?,
    enName: json['enName'] as String?,
    arName: json['arName'] as String?,
    image: json['image'] as String?,
    status: json['status'] as String?,
    insertdate: json['insertdate'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enName': instance.enName,
      'arName': instance.arName,
      'image': instance.image,
      'status': instance.status,
      'insertdate': instance.insertdate,
      'name': instance.name,
    };
