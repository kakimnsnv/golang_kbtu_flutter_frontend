import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/entities/product.dart';
import 'package:golang_kbtu_flutter_frontend/services/api_service.dart';

class HomeController extends GetxController {
  static HomeController get find => Get.find();
  final ApiService apiService = Get.find();

  RxList<Product> products = <Product>[].obs;

  void getProducts() async {
    final apiProducts = await apiService.getProducts();
    if (apiProducts != null) {
      products.value = apiProducts;
    }
  }

  void likeProduct(Product product) async {
    product.isLiked ? await apiService.unlikeProduct(product.id) : await apiService.likeProduct(product.id);
    product.isLiked = !product.isLiked;
  }

  void addToCart(Product product) async {
    await apiService.addToCart(product.id);
  }
}
