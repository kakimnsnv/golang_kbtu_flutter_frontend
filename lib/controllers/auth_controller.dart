import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/main_controller.dart';
import 'package:golang_kbtu_flutter_frontend/services/api_service.dart';

class AuthController extends GetxController {
  static AuthController get find => Get.find();
  final ApiService apiService = Get.find();
  final MainController mainController = Get.find();

  RxBool isLogged = false.obs;

  RxString email = ''.obs;

  RxString password = ''.obs;

  void register() async {
    if (email.value == "" || password.value == "") {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    final success = await apiService.register(email.value, password.value);
    if (success) {
      Get.snackbar("Success", "User registered");
      isLogged.value = true;
      mainController.cart.value = true;
    } else {
      Get.snackbar("Error", "User not registered");
      isLogged.value = false;
      mainController.cart.value = false;
    }
  }

  void login() async {
    if (email.value == "" || password.value == "") {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    final success = await apiService.login(email.value, password.value);
    if (success) {
      Get.snackbar("Success", "User logged in");
      isLogged.value = true;
      mainController.cart.value = true;
    } else {
      Get.snackbar("Error", "User not logged in");
      isLogged.value = false;
      mainController.cart.value = false;
    }
  }

  void logout() async {
    await apiService.logout();
    isLogged.value = false;
    mainController.cart.value = false;
    email.value = "";
    password.value = "";
  }
}
