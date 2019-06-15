import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

bool userChoice;

Expanded buildCustomeButton(Color buttonColor, Color textColor, String buttonText, bool selection){
  return Expanded(
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: FlatButton(  
        textColor: textColor,
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: () {
          print('The use selected $selection');
                  }
                ),
              )
            );
}

class _ButtonCustomState extends State<ButtonCustom> {

  bool userChoice;
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}