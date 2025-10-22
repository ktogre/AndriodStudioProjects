import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      questionText:
          "Bitcoin was the first cryptocurrency to implement blockchain technology.",
      questionAnswer: true,
    ),
    Question(
      questionText:
          "Ethereum uses the Proof of Work consensus mechanism by default in 2025.",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "In Solidity, the 'view' keyword means a function cannot modify the blockchain state.",
      questionAnswer: true,
    ),
    Question(
      questionText:
          "Lionel Messi has won more UEFA Champions League titles than Cristiano Ronaldo.",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "Web3 refers to a decentralized version of the internet powered by blockchain technology.",
      questionAnswer: true,
    ),
    Question(
      questionText: "The 'E' in DeFi stands for Exchange.",
      questionAnswer: false,
    ),
    Question(
      questionText: "NFT stands for Non-Fungible Token.",
      questionAnswer: true,
    ),
    Question(
      questionText:
          "Flutter applications can only be built for Android and cannot run on iOS.",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "The total supply of Bitcoin is capped at 21 million coins.",
      questionAnswer: true,
    ),
    Question(
      questionText: "Vitalik Buterin is the founder of the Solana blockchain.",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "The human brain uses more energy than any other organ in the body.",
      questionAnswer: true,
    ),
    Question(
      questionText: "JavaScript and Java are the same programming language.",
      questionAnswer: false,
    ),
    Question(
      questionText:
          "In the Marvel Cinematic Universe, Tony Stark created Ultron.",
      questionAnswer: true,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      print("The questions are finished");
      return true;
    } else {
      print("The questions are still remaining");
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
