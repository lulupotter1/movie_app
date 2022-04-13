import 'package:json_annotation/json_annotation.dart';

part 'production_companies_object_res.g.dart';

@JsonSerializable()
class ProductionCompaniesObjectRes {
  int id;
  String? logo_path;
  String name;

  ProductionCompaniesObjectRes({
    required this.id,
    this.logo_path,
    required this.name,
  });

  factory ProductionCompaniesObjectRes.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesObjectResFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompaniesObjectResToJson(this);
}
