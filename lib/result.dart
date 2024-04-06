import 'package:flutter/material.dart';

// Widget untuk menampilkan hasil dari quiz
class Result extends StatelessWidget {
  final int score; // Skor total dari quiz
  final Function resetQuiz; // Fungsi untuk mereset quiz

  Result(this.score, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    // Pesan berdasarkan skor
    String message = score >= 80 ? 'Grats!' : 'Lets Play Begin!';

    return Center(
      child: Container(
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.symmetric(vertical: 60.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(31, 37, 68, 1),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/selamat.png",
              width: 150,
              height: 150,
            ),
            Text(
              'Quiz Complete!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score', // Menampilkan skor total
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              message, // Menampilkan pesan berdasarkan skor
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(119, 63, 22, 1.0),
                ),
                minimumSize: MaterialStateProperty.all(Size(200, 40)),
              ),
              onPressed: () => resetQuiz(), // Memanggil fungsi resetQuiz
              child: Text(
                'Back to Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
