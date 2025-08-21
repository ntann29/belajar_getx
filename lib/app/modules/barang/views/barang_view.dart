import 'package:belajar_getx/app/modules/barang/views/barang_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BarangController());
    final formKey = GlobalKey<FormState>(); // ✅ key untuk form

    return Scaffold(
      backgroundColor: Colors.purple[50], 
      appBar: AppBar(
        title: const Text("Form Penjualan Barang"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 2,
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
            child: Form(
              key: formKey, // ✅ hubungkan formKey
              child: Column(
                children: [
                  TextFormField(
                    controller: c.namaController,
                    decoration: const InputDecoration(
                      labelText: "Nama Barang",
                      prefixIcon: Icon(Icons.shopping_bag,
                          color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Nama barang wajib diisi" : null,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: c.jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Jumlah",
                      prefixIcon: Icon(Icons.format_list_numbered,
                          color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Jumlah wajib diisi" : null,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: c.hargaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Harga per Unit",
                      prefixIcon:
                          Icon(Icons.attach_money, color: Colors.deepPurple),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Harga wajib diisi" : null,
                  ),
                  const SizedBox(height: 16),

                  Obx(() => DropdownButtonFormField(
                        value: c.kategori.value.isEmpty ? null : c.kategori.value,
                        items: ["Makanan", "Minuman", "Alat Tulis"]
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => c.kategori.value = val.toString(),
                        decoration: const InputDecoration(
                          labelText: "Kategori",
                          prefixIcon:
                              Icon(Icons.category, color: Colors.deepPurple),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value == null || value.isEmpty ? "Kategori wajib dipilih" : null,
                      )),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // ✅ hanya jalan kalau semua input valid
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
                      icon:
                          const Icon(Icons.check_circle, color: Colors.white),
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
      ),
    );
  }
}
