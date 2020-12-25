import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffe6e6),
        title: Text(
          'EDIT PROFILE',
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full Name….',
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
                        'Email',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff243b6b),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 320,
                        margin: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'john@email.com',
                          ),
                        )
                      ),
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
        onPressed: () {},
      ),
    );
  }
}
