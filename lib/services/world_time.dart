import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime {
  String? location; //location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; //the location url for api endpoints
  bool? isDaytime; //true or false if daytime or not

  Worldtime({this.location,this.flag,this.url});


  //future is like a promise in js (must check out)
  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      //get properties from data
      String? datetime = data['datetime'];
      String? offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create Datetime object
      DateTime now = DateTime.parse(datetime!);
      now = now.add(Duration(hours: int.parse(offset!)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true:false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print('caught error: $e');
      time = 'could not get data';
    }


  }

}
