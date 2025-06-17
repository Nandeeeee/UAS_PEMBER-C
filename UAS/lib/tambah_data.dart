import 'package:flutter/material.dart';

class TambahDataPage extends StatelessWidget {
  const TambahDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController judulController = TextEditingController();
    final TextEditingController deadlineController = TextEditingController();

    String selectedKategori = 'Kuliah';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            labelInput("Judul Tugas :", TextField(controller: judulController)),
            labelInput(
              "Kategori :",
              DropdownButtonFormField<String>(
                value: selectedKategori,
                decoration: const InputDecoration(filled: true),
                items: const [
                  DropdownMenuItem(value: 'Kuliah', child: Text('Kuliah')),
                  DropdownMenuItem(value: 'Organisasi', child: Text('Organisasi')),
                ],
                onChanged: (value) => selectedKategori = value!,
              ),
            ),
            labelInput("Deadline :", TextField(controller: deadlineController)),
            const SizedBox(height: 16),
            const Text("Gambar Pendukung :"),
            const SizedBox(height: 12),
            Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Icon(Icons.camera_alt, size: 50)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelInput(String label, Widget input) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          input,
        ],
      ),
    );
  }
}
