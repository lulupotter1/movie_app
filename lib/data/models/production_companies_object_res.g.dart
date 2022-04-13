// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_companies_object_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompaniesObjectRes _$ProductionCompaniesObjectResFromJson(
        Map<String, dynamic> json) =>
    ProductionCompaniesObjectRes(
      id: json['id'] as int,
      logo_path: json['logo_path'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductionCompaniesObjectResToJson(
        ProductionCompaniesObjectRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logo_path,
      'name': instance.name,
    };
