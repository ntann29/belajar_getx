import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarangController extends GetxController {
  //TODO: Implement BarangController
  
  final namaController = TextEditingController();
  final jumlahController = TextEditingController();
  final hargaController = TextEditingController();

  var kategori = ''.obs;

  var totalSebelumDiskon = 0.0.obs;
  var totalSetelahDiskon = 0.0.obs;

  void hitungTotal() {
    int jumlah = int.tryParse(jumlahController.text) ?? 0;
    double harga = double.tryParse(hargaController.text) ?? 0;

    double total = jumlah * harga;
    totalSebelumDiskon.value = total;

    if (total >= 100000) {
      totalSetelahDiskon.value = total * 0.9;
    } else {
      totalSetelahDiskon.value = total;
    }
  }

  void resetForm() {
    namaController.clear();
    jumlahController.clear();
    hargaController.clear();
    kategori.value = '';
    totalSebelumDiskon.value = 0.0;
    totalSetelahDiskon.value = 0.0;
  }
}