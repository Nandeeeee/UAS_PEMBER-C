import 'package:flutter/material.dart';

class DetailTugasPage extends StatelessWidget {
  final String judul;
  final String deadline;
  final String kategori;
  final bool selesai;

  const DetailTugasPage({
    super.key,
    required this.judul,
    required this.deadline,
    required this.kategori,
    required this.selesai,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Tugas"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildField("Judul Tugas", judul),
            buildField("Kategori", kategori),
            buildField("Deadline", deadline),
            buildField("Keterangan", selesai ? "Sudah Selesai" : "Belum Selesai"),
            const SizedBox(height: 20),
            const Text("Gambar Pendukung :", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              width: 200,
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.image, size: 50)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label :", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
