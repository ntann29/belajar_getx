import 'package:belajar_getx/app/data/models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailView extends StatelessWidget {
  final Album album;

  const AlbumDetailView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album #${album.id}"),
        backgroundColor: Colors.purple[200],
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0), // lebih kecil biar compact
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // card menyesuaikan isi
              children: [
                Text(
                  album.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 20, thickness: 1), // pembatas tipis
                Row(
                  children: [
                    const Icon(Icons.album, color: Colors.purple, size: 20),
                    const SizedBox(width: 6),
                    Text("Album ID: ${album.id}"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person, color: Colors.purple, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      "User ID: ${album.userId}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
