import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCart();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.placeOrder();
        },
        child: Icon(Icons.local_shipping),
      ),
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: Obx(
        () {
          return controller.cart.value.length == 0
              ? Center(child: Text("Cart is empty"))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final cartItem = controller.cart[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          cartItem.product_photo,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        Text(cartItem.product_name).paddingOnly(left: 8),
                        Spacer(),
                        Text("quantity: ${cartItem.quantity}").paddingOnly(left: 8),
                        Text("price: ${cartItem.product_price}").paddingOnly(left: 8),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            controller.removeFromCart(cartItem.product_id);
                          },
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12).marginSymmetric(vertical: 6);
                  },
                  itemCount: controller.cart.length,
                );
        },
      ),
    );
  }
}
