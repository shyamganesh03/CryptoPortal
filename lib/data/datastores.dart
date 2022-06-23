import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
import '../../config/api_keys.dart';

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
  final searchquerry = ''.obs;
  final firebasedata = <UserDatas>[].obs;
  final trdata = <Translation>[].obs;
  final navigation = 1.obs;
  final color = ''.obs;
  final translator = GoogleTranslator();

  initial() {
    trdata.add(Translation(
      from: 'en',
      to: 'ta',
      translated_data: '',
    ));
  }

  changePage(index) {
    navigation(index);
  }

  speehControl(String stream) {
    String color = '';
    if (stream.trim().contains('change icon color to')) {
      color = stream.substring('change icon color to'.length);
      switch (color.trim()) {
        case 'blue':
          iconcolor(Colors.blue);
          break;
        case 'green':
          iconcolor(Colors.green);
          break;
        case 'red':
          iconcolor(Colors.red);
          break;
        case 'white':
          iconcolor(Colors.white);
          break;
        default:
          navigation(9);
      }
    }
    if (stream.trim().contains('change text color to')) {
      color = stream.substring('change text color to'.length);
      switch (color.trim()) {
        case 'blue':
          iconcolor(Colors.blue);
          break;
        case 'green':
          iconcolor(Colors.green);
          break;
        case 'red':
          iconcolor(Colors.red);
          break;
        case 'white':
          iconcolor(Colors.white);
          break;
        default:
          navigation(10);
      }
    } else
      switch (stream.trim()) {
        case 'goto home':
          navigation(1);
          break;
        case 'goto theme':
          navigation(2);
          break;
        case 'goto bookmark':
          navigation(3);
          break;
        case 'goto history':
          navigation(4);
          break;
        case 'goto download':
          navigation(5);
          break;
        case 'goto language':
          navigation(6);
          break;
        default:
          navigation(8);
      }
  }

  serach(value) {
    searchquerry(value);
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

  newuser(
    mailId,
    p1,
    fname,
    lname,
  ) {
    http
        .post(
            Uri.parse(
                "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${firebaseapi}"),
            body: json.encode({'email': mailId, 'password': p1}))
        .then((value) => {
              http.post(
                  Uri.parse(
                      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${firebaseapi}"),
                  body: json.encode({
                    "requestType": "VERIFY_EMAIL",
                    "idToken": json.decode(value.body)['idToken'],
                  }))
            })
        .then((value) => postdata(fname, lname, mailId, p1));
  }

  userLogin(email, password) {
    return http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${firebaseapi}'),
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
  }

  updatepassword() {
    http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=${firebaseapi}'),
        body: json.encode({
          "requestType": "PASSWORD_RESET",
          "email": firebasedata[0].emailid,
        }));
  }
}
