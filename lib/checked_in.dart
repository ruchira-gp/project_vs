import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'constants.dart';
import 'package:flutter/material.dart';


class CheckedIn extends StatefulWidget {
  @override
  _CheckedInState createState() => _CheckedInState();
}

class _CheckedInState extends State<CheckedIn> {

  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Checked-in Visitors'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            // action button
            IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {},
            ),
          ],
          backgroundColor: kDefaultBackGroundColour,
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('data/visitor_data.json'),
          builder: (context,snapshot){
            var myData= json.decode(snapshot.data.toString());
            return new GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context,int index){
              return  buildContainerBox(
                name: myData[index]['V_Name'],
                phNo: myData[index]['V_Contact'],
                checkInTime: myData[index]['V_COT'],
                totalVisitor: myData[index]['V_TotVisitor'],
                visitTime: myData[index]['V_VT'],
              );

            },
                itemCount: myData==null ? 0:myData.length,
            );
          },
        )
        );
  }

  GestureDetector buildContainerBox(
      {String name,
      String phNo,
      String checkInTime,
      String totalVisitor,
      String visitTime}) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('Visitor Details')),
              content: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/user.png'),
                    Text('Name :'+name),
                    Text('Phone Number :'+phNo),
                    Text('Check-in Time '+checkInTime),
                    Text('Total Visitors'+totalVisitor),
                    Text('Visit Time '+visitTime),

                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

              ],
            );
          });
        //LowView(name: name,phNo: phNo,checkInTime: checkInTime,totalVisitor: totalVisitor,visitTime: visitTime,);

      },
      child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'images/user.png',
                      scale: 2,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Visit Time'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$visitTime'),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  '$name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('$phNo'),
                Text(
                  'Check in: $checkInTime',
                  style: TextStyle(color: Colors.green),
                ),
                Text('Total Visitor :$totalVisitor'),
              ],
            ),
          )),
    );
  }
}

class LowView extends StatefulWidget {
  final String name;
  final String phNo;
   final String emp;
 final  String checkInTime;
  final String totalVisitor;
  final String visitTime;
  final String purpose;
  LowView({this.name,this.phNo,this.emp,this.checkInTime,this.totalVisitor,this.visitTime,this.purpose});
  @override
  _LowViewState createState() => _LowViewState();
}

class _LowViewState extends State<LowView> {
  LowView LV;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (BuildContext context,scrollController){
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'images/user.png',
                      scale: 2,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Visit Time'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(LV.visitTime),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  LV.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(LV.phNo),
                Text(
                  'Check in: '+LV.checkInTime,
                  style: TextStyle(color: Colors.green),
                ),
                Text('Total Visitor : '+LV.totalVisitor),
              ],
            ),
          ),);
      },
    );
  }
}
