import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController {
  static MainController get find => Get.find();

  RxInt selectedIndex = 0.obs;
  RxBool cart = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void addCart() {
    cart.value = true;
  }
}
