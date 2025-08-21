import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  bool _isHovered = false;

  final List<Map<String, dynamic>> _menus = [
    {
      "title": "Counter",
      "icon": Icons.exposure_plus_1,
      "route": "/counter",
    },
    {
      "title": "Formulir",
      "icon": Icons.article_outlined,
      "route": "/formulir",
    },
    {
      "title": "Barang",
      "icon": Icons.inventory_2_outlined,
      "route": "/barang",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF), // ungu soft background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE1BEE7),
        title: const Text(
          "Beranda",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            transform: _isHovered
                ? (Matrix4.identity()
                  ..translate(0, -10, 0)) // terbang naik 10px
                : Matrix4.identity(),
            child: Card(
              elevation: _isHovered ? 12 : 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: const Color(0xFFE1BEE7),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.home, size: 60, color: Colors.white),
                    SizedBox(height: 20),
                    Text(
                      "Selamat Datang 💜",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Silakan pilih menu di bawah untuk memulai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: const Color.fromARGB(255, 155, 130, 160),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // langsung navigasi ke route yang dipilih
          Get.toNamed(_menus[index]['route']);
        },
        items: _menus
            .map(
              (menu) => BottomNavigationBarItem(
                icon: Icon(menu['icon']),
                label: menu['title'],
              ),
            )
            .toList(),
      ),
    );
  }
}
