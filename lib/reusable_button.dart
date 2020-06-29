import 'package:flutter/material.dart';

class ReuasableButton extends StatelessWidget {

  const ReuasableButton({@required this.text, @required this.onPress});

  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(text, style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
          ),),
        ),
       // margin: EdgeInsets.only(bottom: 10),
       margin: EdgeInsets.only(top: 10.0),
       
        width: double.infinity,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(12),
          color: Color(0xFFEB1555),
          
        ),
      ),
    );
  }
}