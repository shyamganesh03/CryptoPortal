import 'package:browser/screens/auth/Log_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(GetMaterialApp(
      theme: ThemeData(
          iconTheme: IconThemeData(
        color: Vx.white,
      )),
      darkTheme: ThemeData(
          iconTheme: IconThemeData(
        color: Vx.blue200,
      )),
      // themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LogIn()));
}
