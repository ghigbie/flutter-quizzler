import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
import 'quiz_brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: APP_PADDING),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();

  
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();
  
    setState((){
    if(!quizBrain.isFinished()){
      if(userPickedAnswer == correctAnswer){
        print('User got it right');
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      }else{
        print('User got it wrong');
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
    }else{
      scoreKeeper = [];
      //Widget below
      Alert(
        context: context,
        type: AlertType.info,
        title: "End of Game",
        desc: "Play again?",
        buttons: [
          DialogButton(
            child: Text(
              "Replay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.green
          ),]
      ).show();
      //Widget above
      quizBrain.reset();
      }
      });
  }

  void nextQuestion(){
    setState((){
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(APP_PADDING),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: QUESTION_FONT_SIZE,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(BUTTON_PADDING),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FONT_SIZE,
                ),
              ),
              onPressed: () {
               checkAnswer(true);
              }
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(BUTTON_PADDING),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              }
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

