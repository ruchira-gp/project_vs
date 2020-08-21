import 'package:move_to_background/move_to_background.dart';
import 'package:flutter/material.dart';
import 'package:vs_guard/checked_in.dart';
import 'package:vs_guard/checked_out.dart';
import 'package:vs_guard/login_page.dart';
import 'package:vs_guard/todays_visitors.dart';
import 'constants.dart';
import 'reusables.dart';
import 'visitor_content.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;

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
  String text="";
  String _name = "";
  String _pw = "";
  String _guardName = "Ramesh";
  Uint8List bytes = Uint8List(0);
  TextEditingController _outputController;
  @override

  void initState() {
    getNamePreference().then(updateName);
    getNamePreference().then(updatePw);
    super.initState();
    this._outputController = new TextEditingController();
  }

  Future _scan()  async {
    String barcode = await  scanner.scan();
    this._outputController.text = barcode;
    if(_outputController.text!='123456')
    {
      showDialog(context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Incorrect Code!'),
          )
      );
    }
    else
      {
        showDialog(context: context,
            child: AlertDialog(
              title: Text('QR CODE'),
              content: Text('Correct Code!'),
            )
        );
      }
  }
  Future check()  async {
    String code = await  _outputController.text;
    if(_outputController.text!='123456')
      {
        showDialog(context: context,
        child: AlertDialog(
          title: Text('QR CODE'),
          content: Text('Incorrect Code!'),
         )
        );
      }
  }

  Future _scanBytes() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
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
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Guard Name : $_guardName",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Test',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _scan();

                          },

                          child: ReusableCard(
                            cardChild: Card(
                              child: Image.asset(
                                'images/qrcode.jpg',
                                scale: 2,
                              ),
                            ),
                            text: "QR CODE",
                          ),
                        ),
                        ReusableCard(
                          cardChild: Card(
                            child: Image.asset(
                              'images/hand.jpg',
                              scale: 2,
                            ),
                          ),
                          text: "ENTER CODE",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VisitorContents(
                                text: "Today's \nVisitors ",
                                visNumber: 30,
                                doThis: () {
                                  print("todays");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TodaysVisitors()));
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 130.0,
                              width: 1.0,
                              color: Colors.black,
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VisitorContents(
                                text: "Checked-in\n  Visitors",
                                visNumber: 20,
                                doThis: () {
                                  print(" checked");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckedIn()));
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 130.0,
                              width: 1.0,
                              color: Colors.black,
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: VisitorContents(
                                text: "Checked-out\n  Visitors",
                                visNumber: 20,
                                doThis: () {
                                  print(" checked");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CheckedOut()));
                                },
                              ),
                            ),
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
