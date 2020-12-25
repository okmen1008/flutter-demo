import 'package:flutter/material.dart';
import 'package:project1/base.dart';
import 'package:project1/bottom_item/edit_profile.dart';
import 'package:project1/bottom_item/newtask.dart';
import 'bottom_item/notifications.dart';
import 'package:project1/bottom_item/schedule.dart';
import 'package:project1/login.dart';
import 'package:project1/splash.dart';
import 'bottom_item/profile.dart';
import 'bottom_item/todo.dart';
import 'login.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/login': (context) => LogIn(),
          '/register': (context) => Register(),
          '/profile': (context) => Profile(),
          '/todo': (context) => ToDo(),
          '/schedule': (context) => Schedule(),
          '/notifications': (context) => Notifications(),
          '/base': (context) => Base(),
          '/editprofile': (context) => EditProfile(),
          '/newtask': (context) => NewTask(),
        },
      title: 'My first app',
      home: Splash(),
    );
  }
}


