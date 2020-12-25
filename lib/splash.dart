import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1000),() {
      Navigator.pushNamed(context, '/login');
      this.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splash screen',
      home: Container(
        color: Color(0xffffeeee),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  image: AssetImage('img/1.PNG'),
                  width: 120,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'candy',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff243b6b),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Simple Task Manager',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[400],
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: CircularProgressIndicator(),
              ),
              // Container(
              //   margin: EdgeInsets.only(bottom: 10),
              //   child: Text(
              //     '2017 candy',
              //     style: TextStyle(
              //       color: Color(0xff243b6b),
              //       fontSize: 12,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
