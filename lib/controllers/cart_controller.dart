import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:golang_kbtu_flutter_frontend/entities/cart.dart';
import 'package:golang_kbtu_flutter_frontend/services/api_service.dart';

class CartController extends GetxController {
  static CartController get find => Get.find();
  final ApiService apiService = Get.find();

  RxDouble cartTotal = 0.0.obs;
  RxList<CartItem> cart = <CartItem>[].obs;

  void getCart() async {
    final res = await apiService.getCart();
    if (res != null) {
      cart.value = res.items;
      cartTotal.value = res.total;
    }
  }

  void removeFromCart(String productId) async {
    await apiService.removeFromCart(productId);
    getCart();
  }

  void changeQuantity(String productId, int quantity) async {
    await apiService.changeCartItemQuantity(productId, quantity);
    getCart();
  }

  void placeOrder() async {
    final res = await apiService.placeOrder();
    if (res) Get.snackbar("Success", "Order placed successfully");

    getCart();
  }
}
