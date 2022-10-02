import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Do you support and contribute to recycling, reusing and reducing waste?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Q2. Do you use plastic containers or glass jars to store food?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': ' Q3. Do you separate your trash according to wet waste, plastics, paper glass, etc?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': 'Q4. Do you turn off the lights whenever you leave a room?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q5. Do you leave the water running when you brush your teeth?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q6. When you dine out, do you use a plastic straw for your drink?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q7. Do you take reusable tote bags with you when you shop?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q8. Do you know about the UN Sustainable Development Goals and their importance?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q9. Do you prefer and support sustainable brands while shopping for food, clothes, etc.?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText':
      'Q10. Lastly, are you ready to be a more environmentally friendly citizen by the use of ACT app?',
      'answers': [
        {'text': 'Yes', 'score': 1},
        {'text': 'No', 'score': 0},
      ],
    },

  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;



    Future.delayed(Duration.zero, () async {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    });

    // ignore: avoid_print
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }



    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ACT App'),
            backgroundColor: const Color(0xFF1700E6),
          ),

            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: _questionIndex < _questions.length
                  ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Quiz
               : Result(_totalScore, _resetQuiz) ,

            ),
              //Padding

        ), //Scaffold
         debugShowCheckedModeBanner: false,
      ); //MaterialApp
    }
}
