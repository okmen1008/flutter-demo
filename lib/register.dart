import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project1/data_util/account.dart';
import 'package:project1/data_util/sharedpreferences.dart';
import 'login.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterStatefull();
  }
}

class RegisterStatefull extends StatefulWidget {
  @override
  _RegisterStatefullState createState() => _RegisterStatefullState();
}

class _RegisterStatefullState extends State<RegisterStatefull> {

  final email = GlobalKey<FormState>();
  final password = GlobalKey<FormState>();
  final confirm_password = GlobalKey<FormState>();
  String msg = '';

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirm_passController = TextEditingController();

  List<Account> lstAccount = [];
  PreferencesUtil sharePre = PreferencesUtil();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    confirm_passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    PreferencesUtil.getListAccount("listAccount", (result) {
      setState(() {
        lstAccount = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[30],
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
                  'REGISTER',
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
                  Container(
                    color: Colors.white,
                    // width: 311,
                    // height: 51,
                    child: Form(
                      key: email,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        'Password'
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    // width: 311,
                    // height: 51,
                    child: Center(
                      child: Form(
                        key: password,
                        child: TextFormField(
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        'Confirm Password'
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    // width: 311,
                    // height: 51,
                    child: Center(
                      child: Form(
                        key: confirm_password,
                        child: TextFormField(
                          controller: confirm_passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                        onPressed: () {
                          bool check = true;
                          Account acc;
                          print(emailController.value);
                          if (email.currentState.validate() && password.currentState.validate()) {
                            acc = new Account();
                            acc.email = emailController.value.text;
                            acc.password = passController.value.text;
                            acc.name = 'Name dafault';
                            print(lstAccount);
                            for (var i = 0; i < lstAccount.length; i++) {
                              if (acc.email == lstAccount[i].email) {
                                check = false;
                                break;
                              }
                            }
                            if (check) {
                              lstAccount.add(acc);
                              PreferencesUtil().setListAccount("listAccount", lstAccount);
                              Navigator.pushNamed(context,'/login');
                            }
                            else {
                              setState(() {
                                msg = 'email da ton tai';
                              });
                            }
                          }
                        },
                        color: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          'Have account? Log in',
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

