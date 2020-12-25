import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/login.dart';
import 'main.dart';

Drawer drawerr(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/2.jpg'),
              radius: 40.0,
            ),
            title: Text(
              'abc',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.pending
          ),
          title: Text('To - do'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
              Icons.schedule
          ),
          title: Text('Schedule'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
              Icons.notifications
          ),
          title: Text('Notification'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
              Icons.person_pin
          ),
          title: Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
              Icons.logout
          ),
          title: Text('Logout'),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    ),
  );
}

