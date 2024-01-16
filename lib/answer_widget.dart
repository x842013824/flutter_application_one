import 'package:flutter/material.dart';
import 'package:flutter_application_one/answer_entity.dart';

class AnswerWidget extends StatelessWidget {
  final List<AnswerEntity> _answers;

  final ValueChanged<num> onAnswer;

  const AnswerWidget(this._answers, this.onAnswer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var answer in _answers)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () => onAnswer(answer.score),
              child: Text(answer.label),
            ),
          )
      ],
    );
  }
}
