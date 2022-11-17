import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> datas = [];
Future readData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas = pref.getStringList('key') ?? [];
}

Future addData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas.add("""Write here..""");
  pref.setStringList('key', datas);
  readData();
}

Future removeData(String mline) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  datas.remove(mline);
  pref.setStringList('key', datas);
  readData();
}

Future saveData(int index, String newline) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  datas[index] = newline;
  pref.setStringList('key', datas);
  readData();
}
