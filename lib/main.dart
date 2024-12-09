import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/auth_controller.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/cart_controller.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/home_controller.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/main_controller.dart';
import 'package:golang_kbtu_flutter_frontend/screens/main_screen.dart';
import 'package:golang_kbtu_flutter_frontend/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put<ApiService>(ApiService(), permanent: true);
        Get.put<MainController>(MainController());
        Get.put<AuthController>(AuthController(), permanent: true);
        Get.lazyPut<CartController>(() => CartController(), fenix: true);
        Get.put<HomeController>(HomeController());
      }),
      home: MainScreen(),
    );
  }
}
