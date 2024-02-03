import 'questions.dart';

class Quizbrain{
  int _questionnumber = 0;
  List <Question> _questionBank = [
    Question(q: ('The largest river in the world is Amazon River'), a: false),
    Question(q: ('Daily your nose and sinuses create almost one litre of mucus'), a: true),
    Question(q: 'The letter A is the most commonly used in the English language', a: false), 
    Question(q: 'Every country in the world has a rectangular flag', a: false),
    Question(q: 'The hummingbird egg is the world\'s smallest bird egg.', a: true),
    Question(q: 'The blue whale is the biggest animal to have ever lived', a: true),
    
    Question(q:'A human brain is the organ with the most fat.' , a: true),
    Question(q: 'All of your taste buds are on your tongue.', a: false),
    Question(q: 'Facebook was the first social media website.', a: false),
    Question(q: 'Russia is so big, it has eleven time zones.', a: true),
    Question(q: 'Google was originally called ''Backrub''', a: true),
  ];
  String getQuestionText( ){
    return _questionBank[_questionnumber].questionText;
  }
  bool getQuestionAnswer( ){
    return _questionBank[_questionnumber].questionAnswer;
  }
  void nextQuestion(){
    if(_questionnumber < _questionBank.length - 1) {
      _questionnumber++;
      print(_questionnumber);
    }
  }

  bool isFinished() {
    if (_questionnumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionnumber = 0;
  }

}

