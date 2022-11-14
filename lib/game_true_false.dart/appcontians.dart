import 'package:appformusic/game_true_false.dart/question.dart';

class Appcontians {
  int _nubmer = 0;
  final List<Question> _thequestions = [
    Question(
        t: 'the number of days at the years is 365',
        i: 'images/imgouther/cta.jpg',
        a: true),
    Question(t: 'hi how are you ', i: 'images/imgouther/faq.jpg', a: true),
    Question(
        t: 'did you find the answer about that question',
        i: 'images/imgouther/cta.jpg',
        a: true),
    Question(
        t: 'ther is a lot of people hit u coz no thing that you do for them',
        i: 'images/imgouther/faq.jpg',
        a: true),
  ];
  void tonext() {
    if(_nubmer < _thequestions.length - 1) {
      _nubmer ++;
    }else {
      _nubmer = 0 ;
    }
  }

  String? GetQuestionText(){
    return _thequestions[_nubmer].questiontext;
  }
  String? GetQuestionimg(){
    return _thequestions[_nubmer].questionimg;
  }
  bool? GetQuestionansw(){
    return _thequestions[_nubmer].questionanswer;
  }
}