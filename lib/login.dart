import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/base.dart';
import 'data_util/account.dart';
import 'data_util/sharedpreferences.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LogInStatefull();
  }
}

class LogInStatefull extends StatefulWidget {
  @override
  _LogInStatefullState createState() => _LogInStatefullState();
}

class _LogInStatefullState extends State<LogInStatefull> {

  final email = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool hintpass = true;
  SharedPreferences localStorage;
  String msg = '';

  List<Account> _listAccount = [
    new Account(email: 'abc', password: '123'),
  ];

  @override
  void initState() {
    super.initState();
    PreferencesUtil.getListAccount("listAccount", (result) {
      setState(() {
        _listAccount = result;
      });
    });
    print(_listAccount);
  }

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    letterSpacing: 5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Email'
                    ),
                  ),
                  Form(
                    key: email,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                        'Password'
                    ),
                  ),
                  Form(
                    key: password,
                    child: TextFormField(
                      controller: passController,
                      obscureText: hintpass,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.queue_sharp,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              hintpass = !hintpass;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 330,
                    height: 51,
                    color: Colors.blue,
                    child: RaisedButton(
                      onPressed: () {
                        Account acc;
                        setState(() {
                          if(email.currentState.validate() && password.currentState.validate()) {
                            acc = new Account();
                            acc.email = emailController.value.text;
                            acc.password = passController.value.text;
                            for (var i = 0; i < _listAccount.length; i++) {
                              var item = _listAccount[i];
                              if (acc.email == item.email && acc.password == item.password) {
                                Navigator.pushReplacementNamed(context, '/base');
                                msg = '';
                                break;
                              } else {
                                msg = 'Sai email hoac mat khau';
                              }
                            }
                          }
                        });
                      },
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'New User? Register Here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$msg',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

