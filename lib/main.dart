import 'package:flutter/material.dart';
import 'Quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
Quizbrain quizbrain = Quizbrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon> scorekeeper = [];
  int score = 0;
  void checkANswer(bool userPickedAnswer){
    bool correctanswer = quizbrain.getQuestionAnswer();
    setState(() {
      if (quizbrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: ' Your score $score',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizbrain.reset();
        score = 0;

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }

      else{
        if(userPickedAnswer == correctanswer){
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
          score ++;
        }
        else{
          scorekeeper.add(Icon(Icons.close, color: Colors.red));
        }

        quizbrain.nextQuestion();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ) ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                // Add your logic for True button press
                checkANswer(true);


              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkANswer(false);


                // Add your logic for True button press
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ),
        //TODO: aDD A rOW HERE AS  a score keeper
        Row(
          children: scorekeeper  as List<Widget>,

        ),
      ],
    );
  }
}