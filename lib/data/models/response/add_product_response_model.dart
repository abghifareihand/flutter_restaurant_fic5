import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_response_model.freezed.dart';
part 'add_product_response_model.g.dart';

@freezed
class AddProductResponseModel with _$AddProductResponseModel {
    const factory AddProductResponseModel({
        required Restaurant data,
        required Meta meta,
    }) = _AddProductResponseModel;

    factory AddProductResponseModel.fromJson(Map<String, dynamic> json) => _$AddProductResponseModelFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
    const factory Restaurant({
        required int id,
        required Attributes attributes,
    }) = _Data;

    factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}

@freezed
class Attributes with _$Attributes {
    const factory Attributes({
        required String name,
        required String description,
        required String latitude,
        required String longitude,
        required String address,
        required String photo,
        required String userId,
        required DateTime createdAt,
        required DateTime updatedAt,
        required DateTime publishedAt,
    }) = _Attributes;

    factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);
}

@freezed
class Meta with _$Meta {
    const factory Meta() = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
