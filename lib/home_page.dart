import 'dart:async';
import 'package:move_to_background/move_to_background.dart';
import 'package:flutter/material.dart';
import 'package:vs_guard/login_page.dart';
import 'constants.dart';
import 'dart:io';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
 /* Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[

              FlatButton(
                child: Text('YES'),
                onPressed: (){
                }
              ),
            ],
          );
        });
  }*/
  String _name ="";
  String _pw="";
  @override
  void initState(){
    getNamePreference().then(updateName);
   getNamePreference().then(updatePw);
    super.initState();
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return true;
      },

      child :Stack(
        children: <Widget>[
          // Max Size
          Container(
            color: Colors.white,
          ),
          Container(
            color: kDefaultBackGroundColour,
            height: 200.0,
            width: double.infinity,
            child: Text(_name,style: TextStyle(color: Colors.blue,fontSize: 30),),
          ),

        ],
      ),
    );
  }

  void updateName(String name) {
    setState(() {
      this._name=name;
    });
  }
  void updatePw(String pw) {
    setState(() {
      this._pw=pw;
    });
  }
}
class FirstLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ColoredBox(
            color: kDefaultBackGroundColour,
            child: SizedBox(
              height: 20,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 20,
            ),
          ),
        )
      ],
    );
  }
}
class SecondLayer extends StatefulWidget {
  @override
  _SecondLayerState createState() => _SecondLayerState();
}

class _SecondLayerState extends State<SecondLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
    );
  }
}


