import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 2',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MenuPage(), // MyApp sudah mengarah ke MenuPage
    );
  }
}

class Makanan {
  final String nama;
  final int harga;
  final String deksripsi;
  const Makanan(this.nama, this.harga, this.deksripsi);
}

const daftarMenu = [
  Makanan('Nasi Goreng', 15000, 'Gurih, lezat, mengenyangkan'),
  Makanan('Mie Ayam', 12000, 'Kenyal, gurih, nikmat'),
  Makanan('Es Teh', 4000, 'Manis, dingin, segar'),
  Makanan('Ayam Bakar', 20000, 'Empuk, manis, gurih'),
  Makanan('Ayam pop', 18000, 'Lembut, gurih, khas'),
  Makanan('Rendang', 20000, 'Kaya bumbu rempah'),
  Makanan('Es Jeruk', 150000, 'Asam, manis, segar'),
];

String formatRibuan(int angka) {
  return angka.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 159, 224),
      appBar: AppBar(title: const Text('Daftar Menu')),
      body: ListView.builder(
        itemCount: daftarMenu.length,
        itemBuilder: (context, index) {
          final item = daftarMenu[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 246, 243, 243),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.restaurant),
              title: Text(item.nama),
              subtitle: Text('Rp ${formatRibuan(item.harga)}'),
              trailing: const Icon(Icons.chevron_right),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailPage(makanan: item)),
                );
              }, // Bagian onTap dan DetailPage dihapus sementara agar persis dengan soal
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(makanan.nama)),
      backgroundColor: const Color.fromARGB(255, 78, 159, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant_menu, size: 80),
            const SizedBox(height: 16),
            Text(makanan.nama, style: const TextStyle(fontSize: 24)),
            Text('Rp ${formatRibuan(makanan.harga)}'),
            const SizedBox(height: 24),
            Text(
              'Tentang Makanan : ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              makanan.deksripsi,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
