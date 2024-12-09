import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  List<CartItem> items;
  double total;

  Cart({
    required this.items,
    required this.total,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartItem {
  String product_id;
  String product_name;
  double product_price;
  String product_photo;
  int quantity;
  double total_price;

  CartItem({
    required this.product_id,
    required this.product_name,
    required this.product_price,
    required this.product_photo,
    required this.quantity,
    required this.total_price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
