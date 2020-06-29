import 'package:bmi_calculator/card_content.dart';
import 'package:bmi_calculator/reusable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {


ResultPage({@required this.interpretation, @required this.result_text, @required this.bmi_result});
String bmi_result;
String result_text;
String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                "Your results",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 52,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              card: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result_text,
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(bmi_result,  style: TextStyle(
                   
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),),
                  Text(interpretation, style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReuasableButton(
             onPress: () {
                  Navigator.pop(context);
                },
                text: "RE-CALCULATE",
          )),
        ],
      ),
    );
  }
}
