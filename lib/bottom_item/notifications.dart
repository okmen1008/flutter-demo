import 'package:flutter/material.dart';
import 'package:project1/drawer.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  static const TextStyle optionStyle = TextStyle(fontSize: 15, color: Color(0xff243b6b));
  static const TextStyle optionStyle2 = TextStyle(fontSize: 12, color: Color(0xff243b6b));

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
          'NOTIFICATIONS',
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
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25.0,
              color: Color(0xff243b6b),
            ),
          )
        ],
      ),
      drawer: drawerr(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 375,
                height: 130,
                color: Color(0xffffeeee),
                child: Container(
                  margin: EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    "Alerts & updates ___",
                    style: TextStyle(
                      color: Color(0xff243b6b),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Today',
                          style: optionStyle2,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xffffe6e6),
                      ),
                      title: Text(
                        'Hooray! You have completed all the tasks for today.',
                        style: optionStyle,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xffffe6e6),
                      ),
                      title: Text('A new update is available! Go to Play Store',
                        style: optionStyle,),
                      onTap: () {},
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Yesterday',
                          style: optionStyle2,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xffffe6e6),
                      ),
                      title: Text(
                        'Hooray! You have completed all the tasks for today.',
                        style: optionStyle,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xffffe6e6),
                      ),
                      title: Text('You missed one task yesterday',
                        style: optionStyle,),
                      onTap: () {},
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Tue, Aug 1, 2017',
                          style: optionStyle2,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        size: 25,
                        color: Color(0xffffe6e6),
                      ),
                      title: Text(
                        'You missed one task yesterday.',
                        style: optionStyle,
                      ),
                      onTap: () {},
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
