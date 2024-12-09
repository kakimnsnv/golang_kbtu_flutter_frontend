import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/main_controller.dart';
import 'package:golang_kbtu_flutter_frontend/screens/auth_screen.dart';
import 'package:golang_kbtu_flutter_frontend/screens/cart_screen.dart';
import 'package:golang_kbtu_flutter_frontend/screens/home_screen.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            if (controller.cart.value) const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          ],
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            HomeScreen(),
            const AuthScreen(),
            CartScreen(),
          ],
        ),
      ),
    );
  }
}
