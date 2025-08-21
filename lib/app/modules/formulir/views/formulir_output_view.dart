import 'package:belajar_getx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:belajar_getx/app/modules/formulir/views/formulir_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({super.key});
  final FormulirController formulir = Get.find<FormulirController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Output'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              formulir.clearForm();
              Get.off(() => FormulirView());
            },
            icon: const Icon(Icons.arrow_back),
            tooltip: "Kembali",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HEADER CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.purple[100], // ungu soft
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Data Formulir",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // ISI CARD
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRow(
                            "Nama", formulir.nameController.text, Icons.person),
                        _buildRow("Kursus", formulir.selectedCourses.value,
                            Icons.book),
                        _buildRow("Tanggal", formulir.formattedDate,
                            Icons.date_range),
                        _buildRow(
                            "Gender", formulir.gender.value, Icons.people),
                      ],
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

  /// Widget reusable utk tiap baris
  Widget _buildRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                Text(value.isEmpty ? "-" : value,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
