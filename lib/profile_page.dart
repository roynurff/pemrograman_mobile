import 'package:flutter/material.dart';
import 'detail_profile_page.dart';
import 'profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KartuNamaPage();
  }
}

class KartuNamaPage extends StatelessWidget {
  final List<KartuNama> kelompok = [
    KartuNama(
      nama: 'Muhammad Ainur Rofik',
      jabatan: 'WEB DEVELOPER',
      email: 'muhammadainur.22005@mhs.unesa.ac.id',
      telepon: '+6285157110104',
      foto: AssetImage('images/rofik.jpg'),
    ),
    KartuNama(
      nama: 'Ihda Anisa Ulfa',
      jabatan: 'DATA ANALYST',
      email: 'ihdaanisa.22019@mhs.unesa.ac.id',
      telepon: '+62882003365621',
      foto: AssetImage('images/anisa.jpg'),
    ),
    KartuNama(
      nama: 'Roy Nurfaza',
      jabatan: 'ANDROID DEVELOPER',
      email: 'roy.22035@mhs.unesa.ac.id',
      telepon: '+6285853111266',
      foto: AssetImage('images/roey.jpg'),
    ),
  ];

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
          'Member of The Groups',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(31, 37, 68, 1),
      ),
      body: ListView.builder(
        itemCount: kelompok.length,
        itemBuilder: (context, index) {
          return KartuNamaWidget(kartu: kelompok[index]);
        },
      ),
    );
  }
}

class KartuNamaWidget extends StatelessWidget {
  final KartuNama kartu;
  KartuNamaWidget({required this.kartu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.grey[800],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProfilePage(kartu),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: kartu.foto,
                backgroundColor: Colors.yellow,
                radius: 60,
              ),
            ),
            Text(
              kartu.nama,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              kartu.jabatan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
