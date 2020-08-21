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

  Card buildContainerBox(
      {String name,
      String phNo,
      String checkInTime,
      String totalVisitor,
      String visitTime}) {
    return Card(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Visit Time'),
                      Text('$visitTime'),
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
        ));
  }
}
