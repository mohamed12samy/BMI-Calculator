import 'package:flutter/material.dart';

class ReusaleCardContent extends StatelessWidget {
   ReusaleCardContent({
     this.gender,
     this.icon
  }) ;

final String gender ;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          ),
          SizedBox(height: 10,),
          Text(gender,
          style: TextStyle(
            color: Color(0xFF8D8E98),
            fontSize: 16
          ),)
      ],
    );
  }
}

