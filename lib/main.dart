import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'constants.dart';

void main() {
  runApp(VSGuard());
}

class VSGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute:RouteGenerator.generateRoute,
    );
  }
}
class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kDefaultBackGroundColour,
      home: Column(
        children: [
          Expanded(

          )
        ],
      )
    );
  }
}
