import 'package:flutter/material.dart';
import 'package:world_time_test/pages//location.dart';
import 'package:world_time_test/pages/home.dart';
import 'package:world_time_test/pages/loading.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => Location(),
    },
  ));
}
class test extends StatefulWidget {
  @override 
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'This is test',
      ),
    );
  }
}

