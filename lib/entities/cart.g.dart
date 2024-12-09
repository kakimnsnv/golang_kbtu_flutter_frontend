// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      product_id: json['product_id'] as String,
      product_name: json['product_name'] as String,
      product_price: (json['product_price'] as num).toDouble(),
      product_photo: json['product_photo'] as String,
      quantity: (json['quantity'] as num).toInt(),
      total_price: (json['total_price'] as num).toDouble(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'product_price': instance.product_price,
      'product_photo': instance.product_photo,
      'quantity': instance.quantity,
      'total_price': instance.total_price,
    };
