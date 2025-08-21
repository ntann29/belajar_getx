import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';
import 'barang_view.dart';

class BarangOutputView extends StatelessWidget {
  const BarangOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BarangController>();

    return Scaffold(
      backgroundColor: Colors.purple[50], // background soft
      appBar: AppBar(
        title: const Text("Data Penjualan"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.shopping_bag,
                          color: Colors.deepPurple),
                      title: const Text("Nama Barang"),
                      subtitle: Text(c.namaController.text),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.category, color: Colors.deepPurple),
                      title: const Text("Kategori"),
                      subtitle: Text(c.kategori.value),
                    ),
                    ListTile(
                      leading: const Icon(Icons.format_list_numbered,
                          color: Colors.deepPurple),
                      title: const Text("Jumlah"),
                      subtitle: Text(c.jumlahController.text),
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money,
                          color: Colors.deepPurple),
                      title: const Text("Harga per Unit"),
                      subtitle: Text("Rp ${c.hargaController.text}"),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.calculate, color: Colors.deepPurple),
                      title: const Text("Total Sebelum Diskon"),
                      subtitle: Text("Rp ${c.totalSebelumDiskon.value}"),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.discount, color: Colors.deepPurple),
                      title: const Text("Total Setelah Diskon"),
                      subtitle: Text("Rp ${c.totalSetelahDiskon.value}"),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            label: const Text(
                              "Kembali",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              c.resetForm();
                              Get.offAll(() => const BarangView());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon:
                                const Icon(Icons.refresh, color: Colors.white),
                            label: const Text(
                              "Reset Form",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
