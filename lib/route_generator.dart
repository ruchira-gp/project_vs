import 'package:flutter/material.dart';
import 'main.dart';
class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args =settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> FirstPage());
      case '/second':

    }

  }
}