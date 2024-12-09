import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String photo;
  String description;
  double price;
  bool isLiked;

  Product({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.price,
    required this.isLiked,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductRequest {
  String name;
  String description;
  double price;
  String photo;

  ProductRequest({
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
  });

  factory ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);
}
