import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/entities/cart.dart';
import 'package:golang_kbtu_flutter_frontend/entities/product.dart';

class ApiService extends GetxController {
  static ApiService get find => Get.find();

  late Dio dio;

  RxString token = "".obs;

  ApiService() {
    dio = Dio(BaseOptions(baseUrl: "http://localhost:8080/api/v1", connectTimeout: const Duration(seconds: 5), receiveTimeout: const Duration(seconds: 5), contentType: Headers.jsonContentType));
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio.post("/auth/login", data: {"email": email, "password": password});
      if (response.statusCode == 200) {
        token.value = response.data["accessToken"];
        dio.options.headers["Authorization"] = "Bearer ${token.value}";
        return true;
      } else {
        Get.snackbar("Error", "Failed to login: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to login: $e");
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      final response = await dio.post("/auth/register", data: {"email": email, "password": password});
      if (response.statusCode == 202) {
        token.value = response.data["accessToken"];
        dio.options.headers["Authorization"] = "Bearer ${token.value}";
        return true;
      } else {
        Get.snackbar("Error", "Failed to register: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to register: $e");
      return false;
    }
  }

  Future<void> logout() async {
    token.value = "";
    dio.options.headers["Authorization"] = null;
  }

  // MARK: products

  Future<List<Product>?> getProducts() async {
    try {
      final response = await dio.get("/products");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        Get.snackbar("Error", "Failed to load products: ${response.data["error"]}");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load products: $e");
    }
    return null;
  }

  // MARK: like

  Future<bool> likeProduct(String id) async {
    try {
      final response = await dio.post("/products/$id/like");
      if (response.statusCode == 202) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to like product: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to like product: $e");
      return false;
    }
  }

  Future<bool> unlikeProduct(String id) async {
    try {
      final response = await dio.post("/products/$id/unlike");
      if (response.statusCode == 202) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to unlike product: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to unlike product: $e");
      return false;
    }
  }

  // MARK: cart

  Future<Cart?> getCart() async {
    try {
      final response = await dio.get("/cart");
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return Cart.fromJson(data);
      } else {
        Get.snackbar("Error", "Failed to load cart: ${response.data["error"]}");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load cart: $e");
    }
    return null;
  }

  Future<bool> removeFromCart(String id) async {
    try {
      final response = await dio.delete("/cart/product/$id");
      if (response.statusCode == 202) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to remove from cart: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to remove from cart: $e");
      return false;
    }
  }

  Future<bool> changeCartItemQuantity(String id, int quantity) async {
    try {
      final response = await dio.put("/cart/product/$id?quantity=$quantity");
      if (response.statusCode == 202) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to change cart item quantity: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to change cart item quantity: $e");
      return false;
    }
  }

  Future<bool> addToCart(String id) async {
    try {
      final response = await dio.post("/cart/product/$id?quantity=1");
      if (response.statusCode == 202) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to add to cart: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to add to cart: $e");
      return false;
    }
  }

  //  MARK: order

  Future<bool> placeOrder() async {
    try {
      final response = await dio.post("/orders");
      if (response.statusCode == 200) {
        return true;
      } else {
        Get.snackbar("Error", "Failed to place order: ${response.data["error"]}");
        return false;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to place order: $e");
      return false;
    }
  }
}
