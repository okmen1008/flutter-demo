import 'package:flutter/material.dart';
import 'package:project1/data_util/sharedpreferences.dart';
import 'package:project1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project1/data_util/listtodo.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _task = GlobalKey<FormState>();
  final myController = TextEditingController();
  bool _click = false, _click1 = false;
  static const TextStyle optionStyle = TextStyle(fontSize: 17, color: Color(0xff243b6b));

  PreferencesUtil sharePre = PreferencesUtil();
  List<ToDos> _listToDos = [];

  void addToList(String text){
    ToDos todo = new ToDos(check: false, title: text);
    _listToDos.add(todo);
    PreferencesUtil().setListToDo("listToDo", _listToDos);
  }

  @override
  void initState() {
    super.initState();
    PreferencesUtil.getListToDo("listToDo", (result) {
      setState(() {
        _listToDos = result;
      });
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffe6e6),
        title: Text(
          'NEW TASK',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff243b6b),
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.help,
            size: 25,
            color: Color(0xff243b6b),
          ),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xffffe6e6),
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  child: Form(
                    key: _task,
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: 'Write here….',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Complete by',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff243b6b),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: 320,
                          height: 51,
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              hintText: 'select a date',
                            ),
                          )
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Priority',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff243b6b),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: 320,
                          height: 51,
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              suffixIcon: Icon(
                                Icons.queue,
                                size: 30,
                              ),
                            ),
                          )
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 30, left: 15, bottom: 15),
                      child: Opacity(
                        opacity: 0.5,
                        child: Text(
                          'More Options',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff243b6b),
                          ),
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: Text(
                        'Save as alarm',
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
                        'Show as notification',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff243b6b),
        child: Icon(
          Icons.check,
          size: 25,
        ),
        onPressed: () {
          setState(() {
            if(_task.currentState.validate()) {
              addToList(myController.value.text);
              Navigator.pushReplacementNamed(context, '/base');
            }
          });
        },
      ),
    );
  }
}
