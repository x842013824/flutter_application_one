import 'package:flutter_application_one/answer_entity.dart';

class QuestionEntity {
  String label;

  List<AnswerEntity> answers;

  QuestionEntity({required this.label, required this.answers});
}
