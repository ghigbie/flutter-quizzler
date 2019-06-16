import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';
import 'question.dart';
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
  int questionIndex = 0;
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
                quizBrain.questionBank[questionIndex].questionText,
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
                bool correctAnswer = quizBrain.questionBank[questionIndex].quesitonAnswer;
                  if(correctAnswer == selectedAnswer){
                  setState(() {
                    scoreKeeper.add(
                      Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  
                  if(questionIndex <= 2){
                    questionIndex++;
                  }
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
                bool correctAnswer = quizBrain.questionBank[questionIndex].quesitonAnswer;
                if(correctAnswer == selectedAnswer){
                setState(() {
                  scoreKeeper.add(
                    Icon(
                     Icons.close,
                     color: Colors.red,
                  ),
                );
                  if(questionIndex <= 2){
                    questionIndex++;
                  }
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

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
