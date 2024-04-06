import 'package:flutter/material.dart';
        import 'theme_selection_page.dart';
        import 'profile_page.dart'; // Import file profile_page.dart

        class HomePage extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
        return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bgg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "images/quizzz.png", // Path gambar logo
                width: 350, // Lebar gambar
                height: 200, // Tinggi gambar
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 200, // Lebar tombol
                height: 50, // Tinggi tombol
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(31, 37, 68, 1),
                    ),),
                  onPressed: () {
                    // Navigasi ke halaman pemilihan tema saat tombol "Start Quiz" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThemeSelectionPage()),
                    );
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200, // Lebar tombol
                height: 50, // Tinggi tombol
                child: ElevatedButton(style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(31, 37, 68, 1),
                  ),),
                  onPressed: () {
                    // Navigasi ke halaman profil saat tombol "Profile" ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200, // Lebar tombol
                height: 50, // Tinggi tombol
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(31, 37, 68, 1),
                    ),),
                  onPressed: () {
                    // Keluar dari aplikasi saat tombol "Exit" ditekan
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Exit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
