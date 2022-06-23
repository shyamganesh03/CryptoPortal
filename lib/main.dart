import 'package:firebase_dart/firebase_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import './config/colors.dart';
import 'data/datastores.dart';
import 'screens/home/Mhome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  FirebaseDart.setup();
  final storeController = Get.put(DataStore());
  storeController.initial();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: MHome()));
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(950, 500);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Crypto Portal";
    win.show();
  });
}
