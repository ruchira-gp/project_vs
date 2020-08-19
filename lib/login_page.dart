import 'package:flutter/material.dart';
import 'package:vs_guard/constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<bool> _onInvalidLogin() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('PW or UID is wrong'),
            actions: <Widget>[
              FlatButton(
                child: Text('RETRY'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

            ],
          );
        });
  }

  final myControllerlog = TextEditingController();
  final myControllerpw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(backgroundColor: kDefaultBackGroundColour,),
          body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, position) {
              return
               SafeArea(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      color: kDefaultBackGroundColour,
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset('images/ic_prusight_logo.png',scale: 2.5,),
                              SizedBox(
                                height: 10,

                              ),
                              Text('Guard',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),

                          Image.asset('images/guard_login.png',scale: 4,),

                        ],

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: myControllerlog,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "USER NAME",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: myControllerpw,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'PASSWORD',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: FlatButton(
                          child: Text('LOG IN'),
                          color: Colors.blue,
                          onPressed: () {
                            if(myControllerlog.text=='abc' && myControllerpw.text=='123')
                              {
                                setState(() {
                                  myControllerpw.text="";
                                  myControllerlog.text="";
                                  logged=true;

                                });
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                              }
                            else
                              {
                                _onInvalidLogin();
                              }
                          }),
                    )
                  ],
              ));
            },
          ),
        ));
  }
}
