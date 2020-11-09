import 'package:flutter/material.dart';
import 'package:world_time_test/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../navigation.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String uname = 'loading';


  void SetWorldTime() async{
    WorldTime TimeNow = WorldTime(location: 'Lahore',flag: 'pakistan.png', url: 'Asia/Karachi');
    await TimeNow.getTime();  //Function written in world_time.dart
    uname = TimeNow.url;
    Navigator.pushNamed(context, '/home', arguments: {
      'location': TimeNow.location,
      'flag': TimeNow.flag,
      'time': TimeNow.time,
      'isDayTime' : TimeNow.isDayTime,
    });  // argument to send the data to route '/home'

    
  }



  // void GetData() async {// we need to async to get a  response
  //  Response response =  await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   //print(data['title']);
  //
  //
  //  // Network request
  //   // String name = await Future.delayed(Duration(seconds: 3),(){
  //   //   return 'Arslan';
  //   //
  //   // });
  //   //
  //   // String bio =  await Future.delayed(Duration(seconds: 2),(){
  //   //   return 'Still a student';
  //   //
  //   // });
  //
  //
  // }

  @override
  void initState() {
    super.initState();
    SetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: navigationMenu(context),
      appBar: AppBar(
        title: Text('World Time $uname'),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.blue,
      ),

        body:
        Center(
          child: SpinKitCircle(
            color: Colors.blueGrey,
            size: 50.0,

          ),
        )
    );
  }
}



