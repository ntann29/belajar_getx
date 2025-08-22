import 'package:belajar_getx/app/modules/barang/views/barang_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BarangController());

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[200], // warna ungu muda biar sama
        centerTitle: true, // biar judul di tengah
        title: const Text(
          "Form Penjualan Barang",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: c.namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Barang",
                    prefixIcon:
                        Icon(Icons.shopping_bag, color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: c.jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Jumlah",
                    prefixIcon: Icon(Icons.format_list_numbered,
                        color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: c.hargaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Harga per Unit",
                    prefixIcon:
                        Icon(Icons.attach_money, color: Colors.deepPurple),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => DropdownButtonFormField(
                      value: c.kategori.value.isEmpty ? null : c.kategori.value,
                      items: ["Makanan", "Minuman", "Alat Tulis"]
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => c.kategori.value = val.toString(),
                      decoration: const InputDecoration(
                        labelText: "Kategori",
                        prefixIcon:
                            Icon(Icons.category, color: Colors.deepPurple),
                        border: OutlineInputBorder(),
                      ),
                    )),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (c.namaController.text.isEmpty ||
                          c.jumlahController.text.isEmpty ||
                          c.hargaController.text.isEmpty ||
                          c.kategori.value.isEmpty) {
                        Get.snackbar(
                          "Form Belum Lengkap",
                          "Harap isi semua data terlebih dahulu",
                          backgroundColor: Colors.purple[100],
                          colorText: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(16),
                        );
                      } else {
                        c.hitungTotal();
                        Get.to(() => const BarangOutputView());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text(
                      "Proses",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
