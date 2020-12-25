import 'package:project1/data_util/account.dart';
import 'package:project1/data_util/listtodo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PreferencesUtil {
  static SharedPreferences prefs;
  static Future<void> setup() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void removePreferences(String key) {
    prefs.remove(key);
  }

  setListToDo(key, List<ToDos> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value.map((e) => jsonEncode(e).toString()).toList());
  }

  static getListToDo(key, callBack) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getStringList(key);
    if(value != null) {
      callBack(value.map((e) => ToDos.fromJSon(jsonDecode(e))).toList());
    }
    else {
      callBack(new List<ToDos>());
    }
  }

  setListAccount(key, List<Account> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value.map((o) => jsonEncode(o).toString()).toList());
  }

  static getListAccount(key, callBack) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getStringList(key);
    if (value != null) {
      callBack(value.map((o) => Account.fromJson(jsonDecode(o))).toList());
    } else {
      callBack(new List<Account>());
    }
  }
}