import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF), // soft purple background
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 130, 160),
        title: const Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: const Color(0xFFE1BEE7), // soft purple
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: controller.count.value.toDouble() + 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    child: Text(controller.count.value.toString()),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol minus
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(18),
                  ),
                  onPressed: () {
                    if (controller.count.value > 0) {
                      controller.count.value--;
                    }
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 30),
                // Tombol plus
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(18),
                  ),
                  onPressed: () {
                    if (controller.count.value < 50) {
                      controller.increment();
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
