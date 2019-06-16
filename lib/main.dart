import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
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
                quizBrain.getQuestionText(quizBrain.getQuestionNumber()),
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
                print('The user picked true!');
                bool selectedAnswer = true;
                bool correctAnswer = quizBrain.getQuestionAnswer(quizBrain.getQuestionNumber());
                  if(correctAnswer == selectedAnswer){
                  setState(() {
                    quizBrain.nextQuestion();
                    scoreKeeper.add(
                      Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  });
                }
              },
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
                print('The user picked false');
                bool selectedAnswer = false;
                bool correctAnswer = quizBrain.getQuestionAnswer();
                if(correctAnswer == selectedAnswer){
                setState(() {
                  quizBrain.nextQuestion();
                  scoreKeeper.add(
                    Icon(
                     Icons.close,
                     color: Colors.red,
                  ),
                );
                 });
                }
              }
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

