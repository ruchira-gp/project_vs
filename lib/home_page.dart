import 'dart:async';
import 'package:move_to_background/move_to_background.dart';
import 'package:flutter/material.dart';
import 'package:vs_guard/checked_in.dart';
import 'package:vs_guard/login_page.dart';
import 'constants.dart';
import 'dart:io';
import 'reusables.dart';
import 'icon_content.dart';
import 'visitor_content.dart';

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
  String _name = "";
  String _pw = "";
  String _guardName = "Ramesh";
  @override
  void initState() {
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
      child: Scaffold(
        backgroundColor: kDefaultBackGroundColour,
        body: Stack(
          children: <Widget>[
            // Max Size
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, position) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'images/prusight_logo.png',
                            scale: 1.5,
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.help_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Guard Name : $_guardName",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Test',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        ReusableCard(
                          cardChild: Image.asset(
                            'images/qrcode.jpg',
                            scale: 2,
                          ),
                          text: "QR CODE",
                        ),
                        ReusableCard(
                          cardChild: Image.asset(
                            'images/hand.jpg',
                            scale: 2,
                          ),
                          text: "ENTER CODE",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                       height: 100,
                       margin: EdgeInsets.only(left: 15, right: 15),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.white,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            VisitorContents(
                              text: "Today's Visitors",
                              visNumber: 30,
                              doThis: (){
                                print("todays");
                              },
                            ),
                            Padding(
                              padding:EdgeInsets.symmetric(vertical:10.0),
                              child:Container(
                                height:130.0,
                                width:1.0,
                                color:Colors.black,),),
                            VisitorContents(
                              text: "Checked-in Visitors",
                              visNumber: 20,
                              doThis: (){
                                print(" checked");
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CheckedIn()));                              },
                            ),


                          ],
                        ),
                      ),

                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateName(String name) {
    setState(() {
      this._name = name;
    });
  }

  void updatePw(String pw) {
    setState(() {
      this._pw = pw;
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
