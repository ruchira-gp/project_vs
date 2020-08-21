import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Function onPress;
  final String text;
  ReusableCard({ this.cardChild,this.onPress,this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: cardChild,

          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,

          ),
        ),
        Text('$text',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
      ],
    );
  }
}