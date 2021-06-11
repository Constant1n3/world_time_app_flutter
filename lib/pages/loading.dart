import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getData() async {
  //
  //print(data['title']);
  // }  //   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   p



  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        // child: SpinKitFadingGrid(
        //   color: Colors.white,
        //   size: 90.0,
        // ),
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
            color: index.isEven ? Colors.white : Colors.blue[300],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(1.0), bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(100.0) ),
            ),
          );
          }),
      ),
    );
  }
}
