// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_one/answer_entity.dart';
import 'package:flutter_application_one/answer_widget.dart';
import 'package:flutter_application_one/question_entity.dart';
import 'package:flutter_application_one/question_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<QuestionEntity> _questions = [
    QuestionEntity(
      label: "what's your favorite color?",
      answers: [
        AnswerEntity(label: "black", score: 10),
        AnswerEntity(label: "red", score: 8),
        AnswerEntity(label: "green", score: 5),
        AnswerEntity(label: "white", score: 2),
      ],
    ),
    QuestionEntity(
      label: "what's your favorite animal?",
      answers: [
        AnswerEntity(label: "snake", score: 10),
        AnswerEntity(label: "wolf", score: 8),
        AnswerEntity(label: "dog", score: 5),
        AnswerEntity(label: "cat", score: 2),
      ],
    )
  ];

  int _questionIndex = 0;

  num score = 0;

  bool get isFinished => _questionIndex >= _questions.length;

  void _answer(num value) {
    score += value;
    setState(() => _questionIndex += 1);
    if (isFinished) {
      print("no more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (isFinished) {
      body = const Center(child: Text("You finished Quiz!"));
    } else {
      var question = _questions[_questionIndex];
      body = Column(
        children: [
          QuestionWidget(text: question.label),
          AnswerWidget(question.answers, _answer)
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: body,
    );
  }
}
