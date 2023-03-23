import 'package:quiz_app_dream2/models/question_model.dart';

class QuestionLocalData {
  String name = 'Timur';
  int index = 0;
  List<QuestionModel> suroolorJooptor = [
    QuestionModel(
      suroo: 'Osh Kyrgyzstandyn borboru?',
      joop: false,
    ),
    QuestionModel(
      suroo: 'USA is the biggest counrty in the world?',
      joop: false,
    ),
    QuestionModel(
      suroo: 'Bishkek borbor shaar',
      joop: true,
    ),
  ];
  String surronuAlipKel() {
    if (index < suroolorJooptor.length) {
      return suroolorJooptor[index].suroo!;
    } else {
      return 'suroo buttu';
    }
  }

  bool jooptuAlipKel() {
    return suroolorJooptor[index].joop!;
  }

  void otkoz() {
    index = index + 1;
  }

  void restart() {
    index = 0;
  }
}

final QuestionLocalData questionLocalData = QuestionLocalData();
