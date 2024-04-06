import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz.dart';
import 'result.dart';

// Halaman untuk memilih tema dan menjalankan quiz
class QuizPage extends StatefulWidget {
  final String theme; // Tema quiz (geografi, history, technology)

  QuizPage({required this.theme});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // mengimplementasikan konsep Polimorfisme dengan membuat List berbagai jenis Question.
  List<Question> _geografiQuestions = [
    GeografiQuestion(
      'Gunung tertinggi di dunia adalah...',
      ['Mount Everest', 'K2', 'Kangchenjunga', 'Lhotse', 'Makalu'],
      'Mount Everest',
      'images/geo1.jpg',
    ),
    GeografiQuestion(
      'Apa ibu kota Jerman?',
      ['Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'Cologne'],
      'Berlin',
      'images/geo2.jpeg',
    ),
    GeografiQuestion(
      'Sungai terpanjang di Amerika Serikat?',
      ['Mississippi', 'Missouri', 'Colorado', 'Ohio', 'Columbia'],
      'Mississippi',
      'images/geo3.png',
    ),
    GeografiQuestion(
      'Gunung tertinggi di Eropa adalah',
      ['Mont Blanc', 'Matterhorn', 'Elbrus', 'Eiger', 'Zugspitze'],
      'Elbrus',
      'images/geo4.jpeg',
    ),
    GeografiQuestion(
      'Ibu kota Australia adalah',
      ['Sydney', 'Melbourne', 'Canberra', 'Brisbane', 'Perth'],
      'Canberra',
      'images/geo5.png',
    ),
  ];

  List<Question> _historyQuestions = [
    HistoryQuestion(
      'Siapa presiden pertama Indonesia?',
      [
        'Ir. Soekarno',
        'Moh. Hatta',
        'Dr. Soetomo',
        'Mohammad Natsir',
        'Sutan Sjahrir'
      ],
      'Ir. Soekarno',
      'images/his1.jpg',
    ),
    HistoryQuestion(
      'Siapa tokoh Bapak Pendidikan Nasional?',
      [
        'Ki Hajar Dewantara',
        'Ki Hadjar Dewantoro',
        'Ki Hajar Warsono',
        'Ki Ageng Gribig',
        'Ki Ageng Selo'
      ],
      'Ki Hajar Dewantara',
      'images/his2.jpg',
    ),
    HistoryQuestion(
      'Siapa perdana menteri pertama Indonesia?',
      [
        'Mohammad Hatta',
        'Sutan Sjahrir',
        'Soekarno',
        'Amir Sjarifuddin',
        'Ali Sastroamidjojo'
      ],
      'Sutan Sjahrir',
      'images/his3.jpg',
    ),
    HistoryQuestion(
      'Siapakah tokoh yang menjadi pemimpin PKI?',
      ['DN Aidit', 'Tan Malaka', 'Lukman Hakim', 'Muso', 'Njoto'],
      'DN Aidit',
      'images/his4.jpg',
    ),
    HistoryQuestion(
      'Proklamasi Kemerdekaan Indonesia terjadi pada tanggal?',
      [
        '17 Agustus 1945',
        '19 Agustus 1945',
        '20 Agustus 1945',
        '15 Agustus 1945',
        '16 Agustus 1945'
      ],
      '17 Agustus 1945',
      'images/his5.jpg',
    ),
  ];

  List<Question> _technologyQuestions = [
    TechnologyQuestion(
      'Siapa pendiri perusahaan Apple Inc.?',
      [
        'Steve Jobs',
        'Bill Gates',
        'Jeff Bezos',
        'Larry Page',
        'Mark Zuckerberg'
      ],
      'Steve Jobs',
      'images/tek1.jpg',
    ),
    TechnologyQuestion(
      'Siapakah pencipta sistem operasi Windows?',
      [
        'Steve Jobs',
        'Bill Gates',
        'Linus Torvalds',
        'Jeff Bezos',
        'Mark Zuckerberg'
      ],
      'Bill Gates',
      'images/tek2.jpg',
    ),
    TechnologyQuestion(
      'Siapakah CEO dari perusahaan Apple Inc. saat ini?',
      ['Tim Cook', 'Jeff Bezos', 'Elon Musk', 'Sundar Pichai', 'Satya Nadella'],
      'Tim Cook',
      'images/tek3.jpg',
    ),
    TechnologyQuestion(
      'Siapakah pendiri perusahaan Microsoft?',
      [
        'Jeff Bezos',
        'Steve Jobs',
        'Bill Gates',
        'Larry Page',
        'Mark Zuckerberg'
      ],
      'Bill Gates',
      'images/tek2.jpg',
    ),
    TechnologyQuestion(
      'Siapakah pendiri perusahaan Tesla Motors?',
      [
        'Elon Musk',
        'Jeff Bezos',
        'Larry Page',
        'Mark Zuckerberg',
        'Bill Gates'
      ],
      'Elon Musk',
      'images/tek5.jpg',
    ),
  ];

  late List<Question> _currentQuestions;
  int _questionIndex = 0;
  int _score = 0;
  int _liveScore = 0; // Initialize live score

  @override
  void initState() {
    super.initState();
    // Menentukan list pertanyaan berdasarkan tema yang dipilih
    if (widget.theme == 'history') {
      _currentQuestions = _historyQuestions;
    } else if (widget.theme == 'technology') {
      _currentQuestions = _technologyQuestions;
    } else if (widget.theme == 'geografi') {
      _currentQuestions = _geografiQuestions;
    }
  }

  // Fungsi untuk menangani jawaban dari pengguna
  void _answerQuestion(String answer) {
    if (_currentQuestions[_questionIndex].correctAnswer == answer) {
      _score += 20; // Menambah skor jika jawaban benar
      setState(() {
        _liveScore += 20; // Update live score jika jawaban benar
      });
    }

    setState(() {
      _questionIndex++; // Pindah ke pertanyaan berikutnya
    });
  }

  // Fungsi untuk mereset quiz
  void _resetQuiz() {
    setState(() {
      _score = 0;
      _liveScore = 0; // Reset live score
    });
    Navigator.pop(context); // Kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color.fromRGBO(31, 37, 68, 1),
        title: Text(
          'Quiz - ${widget.theme}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bggeog.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: _questionIndex < _currentQuestions.length
              ? Column(
                  children: [
                    // Menampilkan live score
                    Text(
                      'Score: $_liveScore',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Quiz(
                      question: _currentQuestions[_questionIndex],
                      answerQuestion: _answerQuestion,
                      liveScore: _liveScore, // Mengirim live score ke Quiz
                    ),
                  ],
                )
              : Result(_score, _resetQuiz), // Menampilkan hasil quiz
        ),
      ),
    );
  }
}



