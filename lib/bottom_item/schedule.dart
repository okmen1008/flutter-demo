import 'package:flutter/material.dart';
import 'package:project1/drawer.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool _checked = false, _checked1 = false,
      _checked2 = false, _checked3 = false, _checked4 = false;
  static const TextStyle optionStyle = TextStyle(fontSize: 15, color: Color(0xff243b6b));
  static const TextStyle optionStyle2 = TextStyle(fontSize: 12, color: Color(0xff243b6b));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffffe6e6),
        title: Text(
          'SCHEDULE',
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
                    "Upcoming task",
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
                  width: 375,
                  height: 130,
                  color: Colors.white,
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.only(top: 20),
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Tomorrow',
                              style: optionStyle2,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Checkbox(
                            value: _checked,
                            onChanged: (bool value) {
                              setState(() {
                                _checked = value;
                              });
                            },
                          ),
                          title: Text(
                            'Clean Room',
                            style: optionStyle,
                          ),
                          onTap: () {
                            setState(() {
                              _checked = !_checked;
                            });
                          },
                        ),
                        ListTile(
                          leading: Checkbox(
                            value: _checked1,
                            onChanged: (bool value) {
                              setState(() {
                                _checked1 = value;
                              });
                            },
                          ),
                          title: Text('Take Abby to Doctor',
                            style: optionStyle,),
                          onTap: () {
                            setState(() {
                              _checked1 = !_checked1;
                            });
                          },
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Sat, Aug 5, 2017',
                              style: optionStyle2,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Checkbox(
                            value: _checked2,
                            onChanged: (bool value) {
                              setState(() {
                                _checked2 = value;
                              });
                            },
                          ),
                          title: Text(
                            'Sleep in the afternoon',
                            style: optionStyle,
                          ),
                          onTap: () {
                            setState(() {
                              _checked2 = !_checked2;
                            });
                          },
                        ),
                        ListTile(
                          leading: Checkbox(
                            value: _checked3,
                            onChanged: (bool value) {
                              setState(() {
                                _checked3 = value;
                              });
                            },
                          ),
                          title: Text('Talk to Mom',
                            style: optionStyle,),
                          onTap: () {
                            setState(() {
                              _checked3 = !_checked3;
                            });
                          },
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Sun, Aug 6, 2017',
                              style: optionStyle2,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Checkbox(
                            value: _checked4,
                            onChanged: (bool value) {
                              setState(() {
                                _checked4 = value;
                              });
                            },
                          ),
                          title: Text(
                            'Study UI/UX Design',
                            style: optionStyle,
                          ),
                          onTap: () {
                            setState(() {
                              _checked4 = !_checked4;
                            });
                          },
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
