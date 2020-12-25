import 'package:flutter/material.dart';

class ToDos {
  bool check;
  String title;

  ToDos({this.check, this.title});

  ToDos.fromJSon(Map<String, dynamic> json) {
    check = json["check"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check'] = this.check;
    data['title'] = this.title;
    return data;
  }
}