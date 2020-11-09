import 'package:flutter/material.dart';

import '../navigation.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; //to receive the data //to check if data is empty or not
    print(data);
    String current_location = data['location'];

    // Set Bg image
    String bgimage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo[700] ;


    return Scaffold(
      backgroundColor: bgcolor,
      drawer: navigationMenu(context),
      appBar: AppBar(
        title: Text('About $current_location'),
        backgroundColor: Colors.indigo[700],
        centerTitle: true,
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgimage'),
              fit: BoxFit.cover,
            )
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async{
                      // Navigate to the other screen
                      dynamic  result= await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'isDayTime' : result['isDayTime'],
                          'flag' : result['flag'],
                        };
                      });

                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ) ,
                    )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(data['time'],
                  style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),

              ],
            ),
          ),
        )
      ),
    );
  }
}
