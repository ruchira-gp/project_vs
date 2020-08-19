import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'constants.dart';
import 'dart:async';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(VSGuard());
}

class VSGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialScreen(),
    );
  }
}

class InitialScreen extends StatefulWidget {

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    if (logged == true) {
      Timer(Duration(seconds: 1), () =>
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => HomePage())));
    }
    else {
      Timer(Duration(seconds: 1), () =>
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => LoginPage())));

    }
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColoredBox(
        color: kDefaultBackGroundColour,
        child: Column(
          children: [
            Expanded(
              child: Image.asset('images/logo.png'),
            )
          ],
        ),
      )
    );
  }
}
