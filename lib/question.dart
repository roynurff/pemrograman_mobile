// Ini adalah abstract class yang mewakili konsep Abstraksi.
abstract class Question {
  final String
      questionText; // Encapsulation: Menggunakan modifier `final` untuk menerapkan encapsulation.
  final List<String> options;
  final String correctAnswer;
  final String imagePath;

  // Konstruktor untuk inisialisasi objek Question
  Question(this.questionText, this.options, this.correctAnswer, this.imagePath);
}

// Ini adalah contoh pewarisan (Inheritance) di mana GeografiQuestion adalah subclass dari Question.
class GeografiQuestion extends Question {
  GeografiQuestion(
    String questionText,
    List<String> options,
    String correctAnswer,
    String imagePath,
  ) : super(questionText, options, correctAnswer, imagePath);
}

// Contoh pewarisan lain di mana HistoryQuestion adalah subclass dari Question.
class HistoryQuestion extends Question {
  HistoryQuestion(
    String questionText,
    List<String> options,
    String correctAnswer,
    String imagePath,
  ) : super(questionText, options, correctAnswer, imagePath);
}

// Dan satu lagi contoh pewarisan di mana TechnologyQuestion adalah subclass dari Question.
class TechnologyQuestion extends Question {
  TechnologyQuestion(
    String questionText,
    List<String> options,
    String correctAnswer,
    String imagePath,
  ) : super(questionText, options, correctAnswer, imagePath);
}
