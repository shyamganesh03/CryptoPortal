import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

class UserDatas {
  UserDatas(
      {this.firstname,
      this.lastname,
      this.bookmark,
      this.emailid,
      this.history});
  final firstname;
  final lastname;
  final emailid;
  final history;
  final bookmark;
}

class Translation {
  Translation({this.from, this.to, this.translated_data});
  var from;
  var to;
  var translated_data;
}

class DataStore extends GetxController {
  final font_name = 'Roboto'.obs;
  final fontcolor = Vx.white.obs;
  final iconcolor = Vx.white.obs;
  final firebasedata = <UserDatas>[].obs;
  final trdata = <Translation>[].obs;
  final translator = GoogleTranslator();

  initial() {
    trdata.add(Translation(
      from: 'en',
      to: 'ta',
      translated_data: '',
    ));
  }

  updatetranslation(from, to) {
    trdata[0].from = from;
    trdata[0].to = to;
  }

  updateFontName(String name) {
    font_name(name);
  }

  updateFontColor(color) {
    fontcolor(color);
  }

  updateIconColor(color) {
    iconcolor(color);
  }

  translation(data, TextEditingController textcontrol,
      TextEditingController textcontrol2) async {
    final result = await translator.translate(data,
        from: trdata[0].from, to: trdata[0].to);
    if (textcontrol2.text != '')
      textcontrol.text = result.text;
    else
      textcontrol.text = '';
  }

  getuserdata() async {
    final response = await http.get(Uri.parse(
        'https://cryptobrowser-4cf1b-default-rtdb.asia-southeast1.firebasedatabase.app/Users.json?'));
    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach(((key, value) {
      firebasedata.add(UserDatas(
          firstname: value['fname'],
          lastname: value['lname'],
          emailid: value['emailId'],
          history: value['history'],
          bookmark: ''));
    }));
  }

  postdata(fname, lname, emailid, password) async {
    await http.post(
        Uri.parse(
            'https://cryptobrowser-4cf1b-default-rtdb.asia-southeast1.firebasedatabase.app/Users/${emailid}.json'),
        body: json.encode({
          'fname': fname,
          'lname': lname,
          'emailId': emailid,
          'password': password,
          'history': [],
          'bookmark': [],
        }));
  }
}
