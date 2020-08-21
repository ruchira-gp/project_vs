import 'package:flutter/material.dart';
class IconContents extends StatelessWidget {

  final IconData cardChildIcon;
  final String iconText;
  IconContents({this.cardChildIcon,this.iconText});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          //FontAwesomeIcons.mars,
          cardChildIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: TextStyle(
              fontSize: 18.0, color: Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}
