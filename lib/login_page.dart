import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = "abc@abc";
  String password = "123";

  Future checkLogin() async {
    if (emailController.text == email && passController.text == password) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);

      Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard(),),);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      Fluttertoast.showToast(
          msg: "Username & Password Invalid!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  CircularProgressIndicator pr;

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: kDefaultBackGroundColour,
        automaticallyImplyLeading: false,),
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
                          Image.asset(
                            'images/ic_prusight_logo.png', scale: 2.5,),
                          SizedBox(
                            height: 10,

                          ),
                          Text('Guard', style: TextStyle(fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                        ],
                      ),
                      SizedBox(
                        width: 60,
                      ),

                      Image.asset('images/guard_login.png', scale: 4,),

                    ],

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "USER NAME",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PASSWORD',
                    ),
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
                        checkLogin();
                      }),
                )
              ],
            ));
        },
      ),
    );
  }
}

//      Scaffold(
//      appBar: AppBar(title: Text('Login'),),
//      body: Column(
//        children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: Text('Login',style: TextStyle(fontSize: 25,fontFamily: 'Nasalization'),),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: TextField(
//              controller: emailController,
//              decoration: InputDecoration(labelText:'Username'),),
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: TextField(
//              controller: passController,
//              decoration: InputDecoration(labelText:'Password'),),
//          ),
//          SizedBox(height: 10,),
//          MaterialButton(
//            color: Colors.pink,
//            onPressed: (){
//              checkLogin();
//            },child: Text('Login',style: TextStyle(color: Colors.white)),),
//        ],
//      ),
//    );
//  }


/*class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
Future < bool> saveNamePreference(String name,String pw) async {
  SharedPreferences prefs =await SharedPreferences.getInstance();
  prefs.setString("username", name);
  prefs.setString("pw", pw);
  return prefs.commit();
}

Future <String> getNamePreference() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  String name=pref.getString("username");
  return name;
}
Future <String> getPwPreference() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  String pw=pref.getString("pw");
  return pw;
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
     return
       WillPopScope(
         child: Scaffold(
           appBar: AppBar(backgroundColor: kDefaultBackGroundColour,automaticallyImplyLeading: false,),
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
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                         controller: myControllerlog,
                         obscureText: false,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "USER NAME",
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                         controller: myControllerpw,
                         obscureText: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: 'PASSWORD',
                         ),
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
                             saveName();
                           }),
                     )
                   ],
                 ));
             },
           ),
         ),
       );
   }



  void saveName() {
    String name = myControllerlog.text;
    String pw =myControllerpw.text;
    if(myControllerlog.text=='abc' && myControllerpw.text=='123') {
      saveNamePreference(name, pw).then((bool committed) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      });
      setState(() {
        myControllerpw.text="";
        myControllerlog.text="";
        logged=true;
    });
          }
    else{
      _onInvalidLogin();

    }
  }
}
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = "shawon@gmail.com";
  String password = "123";

  Future checkLogin()async{
    if (emailController.text == email && passController.text == password) {

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);
      Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "Username & Password Invalid!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          // timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Login',style: TextStyle(fontSize: 25,fontFamily: 'Nasalization'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText:'Username'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(labelText:'Password'),),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            color: Colors.pink,
            onPressed: (){
              checkLogin();
            },child: Text('Login',style: TextStyle(color: Colors.white)),),
        ],
      ),
    );
  }
}*/

