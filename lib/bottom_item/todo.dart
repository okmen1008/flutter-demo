import 'package:flutter/material.dart';
import 'package:project1/data_util/sharedpreferences.dart';
import 'package:project1/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project1/data_util/listtodo.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  static const TextStyle optionStyle = TextStyle(fontSize: 15, color: Color(0xff243b6b));

  SharedPreferences localStorage;
  List<ToDos> _listToDos = [
    new ToDos(check: false, title: 'Read Type Guidelines'),
    new ToDos(check: false, title: 'Complete Responsive Design'),
  ];


  @override
  void initState() {
    super.initState();
    PreferencesUtil.getListToDo("listToDo", (result){
      setState(() {
        _listToDos = result;
      });
    });
    print(_listToDos);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffe6e6),
        title: Text(
          'TO-DO',
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
                    "Today's List",
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
                // child: ListView(
                //   children: [
                //     ListTile(
                //       leading: Checkbox(
                //         value: _checked,
                //         onChanged: (bool value) {
                //           setState(() {
                //             _checked = value;
                //           });
                //         },
                //       ),
                //       title: Text(
                //           'Read Type Guidelines',
                //         style: optionStyle,
                //       ),
                //       onTap: () {
                //         setState(() {
                //           _checked = !_checked;
                //         });
                //       },
                //     ),
                //     ListTile(
                //       leading: Checkbox(
                //         value: _checked1,
                //         onChanged: (bool value) {
                //           setState(() {
                //             _checked1 = value;
                //           });
                //         },
                //       ),
                //       title: Text('Complete Responsive Design',
                //         style: optionStyle,),
                //       onTap: () {
                //         setState(() {
                //           _checked1 = !_checked1;
                //         });
                //       },
                //     ),
                //     ListTile(
                //       leading: Checkbox(
                //         value: _checked2,
                //         onChanged: (bool value) {
                //           setState(() {
                //             _checked2 = value;
                //           });
                //         },
                //       ),
                //       title: Text('Bring Groceries',
                //           style: optionStyle),
                //       onTap: () {
                //         setState(() {
                //           _checked2 = !_checked2;
                //         });
                //       },
                //     ),
                //     ListTile(
                //       leading: Checkbox(
                //         value: _checked3,
                //         onChanged: (bool value) {
                //           setState(() {
                //             _checked3 = value;
                //           });
                //         },
                //       ),
                //       title: Text('Take Muffy for walk',
                //           style: optionStyle),
                //       onTap: () {
                //         setState(() {
                //           _checked3 = !_checked3;
                //         });
                //       },
                //     ),
                //     ListTile(
                //       leading: Checkbox(
                //         value: _checked4,
                //         onChanged: (bool value) {
                //           setState(() {
                //             _checked4 = value;
                //           });
                //         },
                //       ),
                //       title: Text('Talk to Pamela and Betty',
                //           style: optionStyle),
                //       onTap: () {
                //         setState(() {
                //           _checked4 = !_checked4;
                //         });
                //       },
                //     ),
                //   ],
                // ),

                child: ListView.builder(
                  itemCount: _listToDos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(
                        value: _listToDos[index].check,
                        onChanged: (bool value) {
                          setState(() {
                            _listToDos[index].check = value;
                          });
                        },
                      ),
                      title: Text('${_listToDos[index].title}', style: optionStyle),
                      onTap: () {
                        setState(() {
                          _listToDos[index].check = !_listToDos[index].check;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
