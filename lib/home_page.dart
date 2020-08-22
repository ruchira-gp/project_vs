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
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
String _guardName = "Ramesh";
class _DashboardState extends State<Dashboard> {
  String email = "";
  Uint8List bytes = Uint8List(0);

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIos: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
    if (_outputController.text != '123456') {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Incorrect Code!'),
          ));
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Correct Code!'),
          ));
    }
  }

  Future check() async {
    String code = await _outputController.text;
    if (_outputController.text != '123456') {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Incorrect Code!'),
          ));
    }
  }

  Future _scanBytes() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    Uint8List bytes = file.readAsBytesSync();
    String barcode = await scanner.scanBytes(bytes);
    this._outputController.text = barcode;
  }

  TextEditingController _outputController;

  @override
  final formKey = GlobalKey<FormState>();
  String _typedCode;

  void initState() {
    super.initState();
    this._outputController = new TextEditingController();
    getEmail();
  }

  void _submit() {
    String x = "123456";
    formKey.currentState.save();
    print(_typedCode);
    if (_typedCode == x) {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Correct Code!'),
          ));
      formKey.currentState.save();
      print(_typedCode);
      print(_typedCode.runtimeType);
      setState(() {
        _typedCode = "";
      });
    } else {
      setState(() {
        _typedCode = "";
      });
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text('QR CODE'),
            content: Text('Incorrect Code!'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        GestureDetector(
                          onTap: () {
                            print('Refresh');
                          },
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Help');
                          },
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text('logout'),
                                content:
                                Text('Are you sure you want to logout?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Yes'),
                                    onPressed: () {

                                      logOut(context);
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                          Login()), (Route<dynamic> route) => false);
                                      void _resetAndOpenPage() {
                                        Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (BuildContext context) => Login()),
                                          ModalRoute.withName('/'),
                                        );
                                      }
                                     // _resetAndOpenPage();
                                    },
                                  ),
                                ],
                              ),
                            );
                            print('logout');
                          },
                          child: Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                          ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 180.0,
                              width: 1.0,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text('ENTER CODE',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              TextFormField(
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 30),
                                                keyboardType:
                                                TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelStyle: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                onSaved: (input) =>
                                                _typedCode = input,
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: RaisedButton(
                                                    onPressed: _submit,
                                                    child: Text('Submit'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ));
                            },
                            child: ReusableCard(
                              cardChild: Card(
                                child: Image.asset(
                                  'images/hand.jpg',
                                  scale: 2,
                                ),
                              ),
                              text: "ENTER CODE",
                            ),
                          )
                        ],
                      ),
                    ),
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
                              visNumber: 40,
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
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Card(
                            child: Container(
                              child:SizedBox(
                                height: 120,
                                width: 150,
                              )
                            ),
                          ),
                          Card(
                            child: Container(
                                child:SizedBox(
                                  height: 120,
                                  width: 100,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}