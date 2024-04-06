import 'package:flutter/material.dart';
import 'question.dart';

// Widget untuk menampilkan pertanyaan dan pilihan jawaban
class Quiz extends StatelessWidget {
  final Question question; // Pertanyaan saat ini
  final Function(String) answerQuestion; // Fungsi untuk menjawab pertanyaan
  final int liveScore; // Skor sementara yang diperbarui

  Quiz({
    required this.question,
    required this.answerQuestion,
    required this.liveScore,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            question.imagePath,
            width: 200,
            height: 110,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            question.questionText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          // Menampilkan opsi jawaban sebagai tombol
          ...question.options.map((option) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(119, 63, 22, 1.0),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(220, 40)),
                ),
                onPressed: () => answerQuestion(option),
                child: Text(
                  option,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
