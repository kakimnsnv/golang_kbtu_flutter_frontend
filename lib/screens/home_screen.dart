import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/auth_controller.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Screen'),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Card(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.photo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stacktrace) {
                          return const Icon(Icons.error);
                        },
                      ),
                      Text(product.name).paddingSymmetric(horizontal: 8),
                      Text(product.description).paddingSymmetric(horizontal: 8),
                      Text(product.price.toString()).paddingSymmetric(horizontal: 8),
                    ],
                  ),
                  if (authController.isLogged.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.5),
                          child: IconButton(
                            color: product.isLiked ? Colors.red : Colors.black,
                            icon: Icon(product.isLiked ? Icons.favorite : Icons.favorite_border),
                            onPressed: () {
                              controller.likeProduct(product);
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.5),
                          child: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.shopping_cart_outlined), // TODO: if in cart show that it is in cart
                            onPressed: () {
                              controller.addToCart(product);
                            },
                          ),
                        ),
                      ],
                    ).paddingAll(4),
                ],
              ),
            );
          },
          itemCount: controller.products.length,
        ),
      ),
    );
  }
}
