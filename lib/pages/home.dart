//import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'yorkshire-day.jpg' : 'river-wallpaper-night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.amber[200] : Colors.indigo[800];
    Color? btColor = data['isDayTime'] ? Color(0xff12005e) : Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0,0),
            child: Column(
            children: [
              TextButton.icon(onPressed: () async {
                  Map? result = await Navigator.pushNamed(context, '/location') as Map;
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                },
                  icon: Icon(
                    Icons.edit_location,
                    color: btColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: btColor,
                    ),

                  )),
              SizedBox(height: 20.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: btColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: btColor,
                ),
              )

            ],
      ),
          ),
        )),
    );
  }
}
