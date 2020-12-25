import 'package:flutter/material.dart';
import 'package:project1/bottom_item/notifications.dart';
import 'package:project1/bottom_item/profile.dart';
import 'package:project1/bottom_item/schedule.dart';
import 'package:project1/bottom_item/todo.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;
  PageController _myPage = PageController(initialPage: 0);

  // int _selectedIndex = 0;
  // static List<Widget> _widgetOptions = <Widget>[
  //   ToDo(),
  //   Schedule(),
  //   Notifications(),
  //   Profile(),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.toc,
      //         size: 30,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.schedule,
      //         size: 30,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.notifications,
      //         size: 30,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.person,
      //         size: 30,
      //       ),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.black,
      //   onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   clipBehavior: Clip.hardEdge,
      //   backgroundColor: Color(0xff243b6b),
      //   child: Icon(
      //     Icons.add,
      //     size: 30,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     setState(() {
      //       Navigator.pushNamed(context, '/newtask');
      //     });
      //   },
      // ),

      body: PageView(
        controller: _myPage,
        onPageChanged: (int i) {
        },
        children: <Widget>[
          ToDo(),
          Schedule(),
          Notifications(),
          Profile(),
        ],
        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),

        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, '/newtask');
              },
              child: Icon(Icons.add, color: Colors.white,),
              // elevation: 5.0,
            ),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            elevation: 20.0,
            shape: CircularNotchedRectangle(),
            child: Container(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(
                        Icons.toc,
                      color: currentIndex == 0 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(0);
                        currentIndex = 0;
                      });
                    },
                  ),

                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.schedule,
                      color: currentIndex == 1 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(1);
                        currentIndex = 1;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.notifications,
                      color: currentIndex == 2 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(2);
                        currentIndex = 2;
                      });
                    },
                  ),
                  IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.person,
                      color: currentIndex == 3 ? Colors.blue : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(3);
                        currentIndex = 3;
                      });
                    },
                  )
                ],
              ),
            ),
        ),
    );
  }
}
