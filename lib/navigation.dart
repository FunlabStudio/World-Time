import 'package:flutter/material.dart';
import 'package:world_time_test/pages//location.dart';
import 'package:world_time_test/pages/location.dart';



Widget navigationMenu(BuildContext context) {
  var navigationMenu = Drawer(
    child: ListView(
      children: [
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text('Home'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');

          },
        ),
        ListTile(
          leading: Icon(Icons.replay),
          title: Text('Loading'),
          onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          },
        ),
        

      ],
    ),

  );

  return navigationMenu;


}
