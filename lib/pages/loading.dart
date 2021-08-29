import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




 void setupWorldtime() async {
   Worldtime instance  = Worldtime(location: 'Berlin',flag:'germany.png', url: 'Europe/Berlin' );
   await instance.getTime();
   Navigator.pushReplacementNamed(context,'/home',arguments: {
     'location': instance.location,
     'flag': instance.flag,
     'time': instance.time,
     'isDaytime': instance.isDaytime
   } );

 }

  @override
  void initState(){
    super.initState();
    setupWorldtime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        )

      ),
    );
  }


}
