import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'constants.dart';
import 'dart:async';
import 'login_page.dart';
import 'home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    home: email == null ? Login() : Dashboard(),
  ));
}

/*class VSGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
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
              builder: (BuildContext context) => Login())));
    }
    else {
      Timer(Duration(seconds: 1), () =>
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => Login())));

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
}*/
