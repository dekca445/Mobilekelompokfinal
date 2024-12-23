import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing1/service/firestore_service.dart';
import 'package:testing1/userData.dart';

class DetailAnggotaScreen extends StatefulWidget {
  @override
  _DetailAnggotaScreenState createState() => _DetailAnggotaScreenState();
}

class _DetailAnggotaScreenState extends State<DetailAnggotaScreen> {
  // Controller untuk TextField
  FirebaseService firebaseService = new FirebaseService();
  TextEditingController nama = TextEditingController();
  TextEditingController umur = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController handphone = TextEditingController();

  // Daftar anggota
  List<Map<String, String>> anggotaList = [
    {
      'nama': 'Apipah',
      'umur': '19',
      'email': 'apipah@gmail.com',
      'alamat': 'Jl. Contoh No. 123',
      'handphone': '081234567890',
    },
    {
      'nama': 'Budi',
      'umur': '22',
      'email': 'budi@gmail.com',
      'alamat': 'Jl. Sejahtera No. 45',
      'handphone': '081234567891',
    },
  ];

  // Fungsi untuk menambahkan anggota baru
  void tambahAnggota() {
    if (nama.text.isNotEmpty &&
        umur.text.isNotEmpty &&
        email.text.isNotEmpty &&
        alamat.text.isNotEmpty &&
        handphone.text.isNotEmpty) {
        // UserData userData = new UserData(
        //   nama.text,
        //   int.parse(umur.text),
        //   email.text,
        //   alamat.text,
        //   int.parse(handphone.text),
        //   );
        // firebaseService.tambah(userData);
      setState(() {
        anggotaList.add({
          'nama': nama.text,
          'umur': umur.text,
          'email': email.text,
          'alamat': alamat.text,
          'handphone': handphone.text,
        });

        // Bersihkan input setelah menyimpan
        nama.clear();
        umur.clear();
        email.clear();
        alamat.clear();
        handphone.clear();
      });
    } else {
      // Tampilkan pesan jika input kosong
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua data!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Fungsi untuk navigasi ke detail anggota
  void lihatDetailAnggota(Map<String, String> anggota) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(40, 55, 77, 1.0),
          title: Text('Detail Anggota', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: ${anggota['nama']}', style: TextStyle(color: Colors.white70)),
              Text('Umur: ${anggota['umur']}', style: TextStyle(color: Colors.white70)),
              Text('Email: ${anggota['email']}', style: TextStyle(color: Colors.white70)),
              Text('Alamat: ${anggota['alamat']}', style: TextStyle(color: Colors.white70)),
              Text('Handphone: ${anggota['handphone']}', style: TextStyle(color: Colors.white70)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup', style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Anggota'),
        backgroundColor: Color.fromRGBO(0, 119, 119, 1.0),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Color.fromRGBO(40, 55, 77, 1.0),
        child: Column(
          children: [
            // Input Data Anggota
            TextField(
              controller: nama,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: umur,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Umur',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: email,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: alamat,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Alamat',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: handphone,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'No HP',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: 
              tambahAnggota,
              child: Text('Simpan'),
            ),
            SizedBox(height: 16),

            // List Data Anggota
            Expanded(
              child: ListView.builder(
                itemCount: anggotaList.length,
                itemBuilder: (context, index) {
                  final anggota = anggotaList[index];
                  return Card(
                    color: Color.fromRGBO(30, 40, 55, 1.0),
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(anggota['nama'] ?? '', style: TextStyle(color: Colors.white)),
                      subtitle: Text('Email: ${anggota['email'] ?? ''}', style: TextStyle(color: Colors.white70)),
                      trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                      onTap: () => lihatDetailAnggota(anggota),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
