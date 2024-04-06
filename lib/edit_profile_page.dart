import 'package:flutter/material.dart';
import 'profile.dart';

class EditProfilePage extends StatefulWidget {
  final KartuNama kartu;
  EditProfilePage(this.kartu);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _namaController;
  late TextEditingController _jabatanController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.kartu.nama);
    _jabatanController = TextEditingController(text: widget.kartu.jabatan);
    _emailController = TextEditingController(text: widget.kartu.email);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _jabatanController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(66, 148, 148, 148),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: Text(
          'Edit Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(31, 37, 68, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _jabatanController,
              decoration: InputDecoration(labelText: 'Jabatan'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                KartuNama updatedKartu = KartuNama(
                  nama: _namaController.text,
                  jabatan: _jabatanController.text,
                  email: _emailController.text,
                  telepon: widget.kartu.telepon,
                  foto: widget.kartu.foto,
                );
                Navigator.pop(context, updatedKartu);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
