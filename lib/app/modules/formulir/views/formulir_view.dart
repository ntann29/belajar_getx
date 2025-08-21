import 'package:belajar_getx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:belajar_getx/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir View'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAll(() => const HomeView());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Card Form
            Card(
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
                      color: Colors.purple[100],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Isi Formulir",
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Nama
                        TextField(
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.person, color: Colors.purple),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Dropdown Kursus
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Pilih Kursus',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.book, color: Colors.purple),
                          ),
                          items: controller.courses.map((course) {
                            return DropdownMenuItem(
                              value: course,
                              child: Text(course),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.selectedCourses.value = value!;
                          },
                        ),
                        const SizedBox(height: 20),

                        // Radio Gender
                        Obx(
                          () => Column(
                            children: [
                              RadioListTile(
                                title: const Text('Laki-laki'),
                                value: 'Laki-laki',
                                groupValue: controller.gender.value,
                                activeColor: Colors.purple,
                                onChanged: (value) {
                                  controller.gender.value = value!;
                                },
                              ),
                              RadioListTile(
                                title: const Text('Perempuan'),
                                value: 'Perempuan',
                                groupValue: controller.gender.value,
                                activeColor: Colors.purple,
                                onChanged: (value) {
                                  controller.gender.value = value!;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Tanggal Lahir
                        Obx(
                          () => TextField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: controller.formattedDate,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Tanggal Lahir',
                              border: OutlineInputBorder(),
                              prefixIcon:
                                  Icon(Icons.date_range, color: Colors.purple),
                            ),
                            onTap: () => controller.pickDate(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔥 Tombol Submit lebih kecil
            Center(
              child: InkWell(
                onTap: () => Get.to(() => FormulirOutputView()),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF9C27B0),
                        Color(0xFFE040FB)
                      ], // ungu → pink
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.send_rounded, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Kirim",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
