import 'package:flutter/material.dart';
import 'todo.dart';
import '../drawer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool drawerClick = false;
  static const TextStyle optionStyle = TextStyle(fontSize: 13, color: Color(0xff243b6b));
  static const TextStyle optionStyle2 = TextStyle(fontSize: 12, color: Color(0xff243b6b));
  bool _click = false, _click1 = false, _click2 = false, _click3 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffffe6e6),
        title: Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff243b6b),
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editprofile');
            },
            icon: Icon(
              Icons.drive_file_rename_outline,
              size: 25.0,
              color: Color(0xff243b6b),
            ),
          )
        ],
      ),
      drawer: drawerr(context),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xffffeeee),
                child: Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20, left: 20),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/2.jpg'),
                          radius: 35.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,top: 5),
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tiffany Schneider',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xff243b6b),
                              ),
                            ),
                            Container(
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  'tiffany.s@email.com',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff243b6b),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Notification Settings',
                          style: optionStyle2,
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Get email notification',
                        style: optionStyle,
                      ),
                      value: _click,
                      onChanged: (bool value) {
                        setState(() {
                          _click = value;
                        });
                      },
                      activeColor: Color(0xff93ffdf),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Vibrate on alert',
                        style: optionStyle,
                      ),
                      value: _click1,
                      onChanged: (bool value) {
                        setState(() {
                          _click1 = value;
                        });
                      },
                      activeColor: Color(0xff93ffdf),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30, left: 15, bottom: 10),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Floss Settings',
                          style: optionStyle2,
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Share profile with other floss user',
                        style: optionStyle,
                      ),
                      value: _click2,
                      onChanged: (bool value) {
                        setState(() {
                          _click2 = value;
                        });
                      },
                      activeColor: Color(0xff93ffdf),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Show your task completion status',
                        style: optionStyle,
                      ),
                      value: _click3,
                      onChanged: (bool value) {
                        setState(() {
                          _click3 = value;
                        });
                      },
                      activeColor: Color(0xff93ffdf),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

