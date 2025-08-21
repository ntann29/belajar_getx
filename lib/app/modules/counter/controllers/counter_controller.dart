import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void increment() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar(
        "Stop", 
        "Nilai sudah mencapai 50",
        snackPosition: SnackPosition.BOTTOM, 
        backgroundColor: Colors.red, 
        colorText: Colors.white, 
      );
    }
  }
}
