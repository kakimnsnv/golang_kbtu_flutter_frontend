// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      isLiked: json['is_liked'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'description': instance.description,
      'price': instance.price,
      'isLiked': instance.isLiked,
    };

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) => ProductRequest(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$ProductRequestToJson(ProductRequest instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'photo': instance.photo,
    };
