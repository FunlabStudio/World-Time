import 'package:flutter/material.dart';
import 'package:world_time_test/Services/world_time.dart';
import 'package:world_time_test/navigation.dart';


class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  //int counter = 0;
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London',flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Egypt',flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
    WorldTime(url: 'Asia/Karachi',location: 'Pakistan',flag: 'Pakistan_flag.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag: 'kenya.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'South Korea',flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Hong_Kong',location: 'China',flag: 'china.png'),
    WorldTime(url: 'Europe/London',location: 'London',flag: 'uk.png'),  // Duplication start here
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Egypt',flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
    WorldTime(url: 'Asia/Karachi',location: 'Pakistan',flag: 'Pakistan_flag.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag: 'kenya.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'South Korea',flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Hong_Kong',location: 'China',flag: 'china.png'),
      ];

    void UpdateTime(index) async{

      WorldTime TimeNow = locations[index];
      await TimeNow.getTime();
      // Navigate to Home screen
      Navigator.pop(context, {
        'location': TimeNow.location,
        'flag': TimeNow.flag,
        'time': TimeNow.time,
        'isDayTime' : TimeNow.isDayTime,
      });

  }




  @override
  Widget build(BuildContext context) {
    //print('build state Run');
    return Scaffold(
      drawer: navigationMenu(context),

      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text('Choose The Location') ,
          elevation: 0,
          centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(    //ListTile is used to show circle with text
                onTap: (){
                  UpdateTime(index);
                },
                title: Text(locations[index].location),

                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );

        },

      ),

    );
  }
}


