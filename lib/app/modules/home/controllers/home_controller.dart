import 'package:get/get.dart';

class HomeController extends GetxController {
  // ini buat ngatur index tab yang aktif
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // fungsi buat ganti tab
  void changePage(int index) {
    currentIndex.value = index;
  }
}
