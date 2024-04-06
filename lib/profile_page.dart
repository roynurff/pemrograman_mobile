import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
    return MaterialApp(
      home: KartuNamaPage(kelompok: kelompok),
    );
  }
}

//TAMPILAN HOME KARTU NAMA------------------------------------------------------

class KartuNamaPage extends StatelessWidget {
  final List<KartuNama> kelompok;
  KartuNamaPage({required this.kelompok});

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
          'Anggota Kelompok',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(31, 37, 68, 1),
      ),

      body: ListView.builder(
        itemCount: kelompok.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.grey[800],
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailKartuNama(kelompok[index]),
                  ),
                );
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: kelompok[index].foto,
                      backgroundColor: Colors.yellow,
                      radius: 60,
                    ),
                  ),
                  Text(
                    kelompok[index].nama,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    kelompok[index].jabatan,
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
        },
      ),
    );
  }
}

class EditKartuNama extends StatefulWidget {
  final KartuNama kartu;

  EditKartuNama(this.kartu);

  @override
  _EditKartuNamaState createState() => _EditKartuNamaState();
}

class _EditKartuNamaState extends State<EditKartuNama> {
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
                // Simpan perubahan
                KartuNama updatedKartu = KartuNama(
                  nama: _namaController.text,
                  jabatan: _jabatanController.text,
                  email: _emailController.text,
                  telepon: widget.kartu.telepon,
                  foto: widget.kartu.foto,
                );

                // Kembalikan data yang telah diperbarui
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

//TAMPILAN DETAIL KATU NAMA-----------------------------------------------------

class DetailKartuNama extends StatelessWidget {
  final KartuNama kartu;

  DetailKartuNama(this.kartu);

  void _editData(BuildContext context, KartuNama kartu) async {
    // Navigasi ke antarmuka pengguna penyuntingan dengan membawa data anggota
    final updateKartu = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditKartuNama(kartu)),
    );
    if (updateKartu != null) {
      // Jika ada perubahan data, ambil data baru dan t
    }
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
          'Detail Data Anggota',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(31, 37, 68, 1),
        actions: [],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  backgroundImage: kartu.foto,
                  backgroundColor: Colors.yellow,
                  radius: 50,
                ),
                SizedBox(height: 10),

//Nama Pada kartu nama

                Text(
                  '${kartu.nama}',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'Poppins'),
                ),
                SizedBox(height: 0),

//Jabatan Pada kartu nama

                Text(
                  '${kartu.jabatan}',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, letterSpacing: 2),
                ),
                SizedBox(height: 10),

//Container Telepon

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 260,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone_iphone, size: 30),
                      Text(
                        '${kartu.telepon}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

//Container Email

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 260,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.mail_outline_rounded, size: 30),
                      Text(
                        '${kartu.email}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _editData(context, kartu);
              },
              child: Icon(Icons.edit),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

//CircleAvatar

class KartuNama {
  final String nama;
  final String jabatan;
  final String email;
  final String telepon;
  final AssetImage foto;

  KartuNama({
    required this.nama,
    required this.jabatan,
    required this.email,
    required this.telepon,
    required this.foto,
  });
}

