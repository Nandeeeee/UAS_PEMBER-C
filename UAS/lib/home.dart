import 'package:flutter/material.dart';
import 'detail.dart';
import 'tambah_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tugasList = [
    {
      'judul': 'Tugas Pemrograman Bergerak',
      'deadline': '31 Mei 2025',
      'kategori': 'Kuliah',
      'selesai': false,
    },
    {
      'judul': 'Laporan Akhir Pember',
      'deadline': '1 Juni 2025',
      'kategori': 'Kuliah',
      'selesai': false,
    },
    {
      'judul': 'Rapat Organisasi',
      'deadline': '1 Juni 2025',
      'kategori': 'Organisasi',
      'selesai': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List Mahasiswa'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 1000,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                dropdownColor: Colors.indigo[900],
                value: 'All',
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: 'All',
                    child: Text('All', style: TextStyle(color: Colors.white)),
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: tugasList.length,
              itemBuilder: (context, index) {
                final tugas = tugasList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailTugasPage(
                                  judul: tugas['judul'],
                                  deadline: tugas['deadline'],
                                  kategori: tugas['kategori'],
                                  selesai: tugas['selesai'],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tugas['judul'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Deadline : ${tugas['deadline']}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                tugas['kategori'],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Checkbox(
                        value: tugas['selesai'],
                        onChanged: (value) {
                          setState(() {
                            tugasList[index]['selesai'] = value!;
                          });
                        },
                        activeColor: Colors.white,
                        checkColor: Colors.teal,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahDataPage()),
          );
        },
      ),
    );
  }
}
