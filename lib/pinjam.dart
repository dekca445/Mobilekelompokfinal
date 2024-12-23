import 'package:flutter/material.dart';

class PinjamScreen extends StatefulWidget {
  @override
  _PinjamScreenState createState() => _PinjamScreenState();
}

class _PinjamScreenState extends State<PinjamScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  DateTime? selectedDate;

  List<Map<String, String>> pinjamList = [];

  void tambahPinjam() {
    if (namaController.text.isNotEmpty &&
        jumlahController.text.isNotEmpty &&
        selectedDate != null) {
      setState(() {
        pinjamList.add({
          'nama': namaController.text,
          'jumlah': jumlahController.text,
          'tanggal': selectedDate!.toIso8601String().split('T')[0], // Format Tanggal
        });

        namaController.clear();
        jumlahController.clear();
        selectedDate = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua data!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

void pilihTanggal(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: Colors.teal, // Warna header
            onPrimary: Colors.white, // Warna teks header
            surface: Color.fromRGBO(40, 55, 77, 1.0), // Latar belakang dialog
            onSurface: Colors.white70, // Warna teks tanggal
          ),
          dialogBackgroundColor: Color.fromRGBO(30, 40, 55, 1.0), // Latar belakang dialog
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null) {
    setState(() {
      selectedDate = pickedDate;
    });
  }
}


  void lihatDetailPinjam(Map<String, String> pinjam) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(40, 55, 77, 1.0),
          title: Text('Detail Pinjam', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama: ${pinjam['nama']}', style: TextStyle(color: Colors.white70)),
              Text('Jumlah: Rp ${pinjam['jumlah']}', style: TextStyle(color: Colors.white70)),
              Text('Tanggal: ${pinjam['tanggal']}', style: TextStyle(color: Colors.white70)),
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
        title: Text('Pinjam'),
        backgroundColor: Color.fromRGBO(0, 119, 119, 1.0),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Color.fromRGBO(40, 55, 77, 1.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
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
              controller: jumlahController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Jumlah',
                labelStyle: TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'Pilih Tanggal'
                        : 'Tanggal: ${selectedDate!.toIso8601String().split('T')[0]}',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => pilihTanggal(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text('Pilih'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: tambahPinjam,
              child: Text('Simpan'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: pinjamList.length,
                itemBuilder: (context, index) {
                  final pinjam = pinjamList[index];
                  return Card(
                    color: Color.fromRGBO(30, 40, 55, 1.0),
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(pinjam['nama'] ?? '', style: TextStyle(color: Colors.white)),
                      subtitle: Text('Jumlah: Rp ${pinjam['jumlah']}', style: TextStyle(color: Colors.white70)),
                      trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                      onTap: () => lihatDetailPinjam(pinjam),
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
