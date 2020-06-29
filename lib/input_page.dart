import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Icon_content.dart';
import 'card_content.dart';

const Color ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const Color INACTIVE_CARD_COLOR = Color(0xFF111328);

int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCard = ACTIVE_CARD_COLOR;
  Color femaleCard = INACTIVE_CARD_COLOR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
             flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            maleCard = ACTIVE_CARD_COLOR;
                            femaleCard = INACTIVE_CARD_COLOR;
                          });
                        },
                        color: maleCard,
                        card: ReusaleCardContent(
                          gender: 'Male',
                          icon: FontAwesomeIcons.male,
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            femaleCard = ACTIVE_CARD_COLOR;
                            maleCard = INACTIVE_CARD_COLOR;
                          });
                        },
                        color: femaleCard,
                        card: ReusaleCardContent(
                          gender: 'Female',
                          icon: FontAwesomeIcons.female,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                           flex: 2,

              child: ReusableCard(
                color: ACTIVE_CARD_COLOR,
                onPress: null,
                card: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: TextStyle(color: Color(0xFF8D8E98), fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 42,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x20EB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                        //activeColor: Color(0xFFEB1555),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                           flex: 2,

              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        color: ACTIVE_CARD_COLOR,
                        onPress: null,
                        card: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Weight",
                              style: TextStyle(
                                  color: Color(0xFF8D8E98), fontSize: 16),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 42,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => handleClick(2),
                                ),
                                SizedBox(width: 6),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => handleClick(1),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        color: ACTIVE_CARD_COLOR,
                        onPress: null,
                        card: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Age",
                              style: TextStyle(
                                  color: Color(0xFF8D8E98), fontSize: 16),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 42,
                                  fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => ageClick(2),
                                ),
                                SizedBox(width: 6),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => ageClick(1),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
                          child: ReuasableButton(
                onPress: () {

                  CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage(
                        bmi_result: calc.calculateBmi(),
                        interpretation: calc.getInterpretation(),
                        result_text: calc.getResult(),

                      )));
                },
                text: "CALCULATE",
              ),
            ),
          ],
        ),
      ),
    );
  }

  handleClick(int x) {
    setState(() {
      if (x == 1) {
        weight++;
      } else
        weight--;
    });
  }

  ageClick(int x) {
    setState(() {
      if (x == 1) {
        age++;
      } else
        age--;
    });
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      elevation: 4,
      child: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
