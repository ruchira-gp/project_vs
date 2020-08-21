import 'package:flutter/material.dart';
import 'package:vs_guard/constants.dart';
class VisitorContents extends StatelessWidget {

  //final IconData cardChildIcon;
  final String text;
  final int visNumber;
  final Function doThis;
  VisitorContents({this.text,this.visNumber,this.doThis});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15.0,
            child: Text('$visNumber',textAlign:TextAlign.center),//style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          RaisedButton(
            child: Text('VIEW'),
            disabledColor: kDefaultBackGroundColour,
            splashColor: kDefaultBackGroundColour,
            onPressed: (){
              doThis();
            },
          ),

        ],
      ),
    );
  }
}