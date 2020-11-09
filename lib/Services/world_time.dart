import 'package:http/http.dart';  //to use http
import 'dart:convert'; // to decode json
import 'package:intl/intl.dart';


class WorldTime{

  String location;  // location name for UI
  String time;      // time of that location
  String flag;       // url of an asset flag
  String url;       // Location Url for api
  bool isDayTime;   // True or false if day time or not

  WorldTime ({this.location, this.flag, this.url});       //constructor to show things


  Future<void> getTime() async{

    try{
      //make the request
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);
      // Get data from property
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);



      print(datetime);
      //print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)) );

      //set the time
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e){
      print('caught error: $e');
      time = 'could not get the location';

    }


      }
}

