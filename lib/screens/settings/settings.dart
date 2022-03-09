import 'package:browser/components/List.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VxAppBar(
          title: 'SETTINGS'
              .text
              .blue800
              .extraBold
              .textStyle(TextStyle(letterSpacing: 3.0))
              .make(),
          centerTitle: true,
        ),
        body: VxBox(
                child: [
          VxBox(
            child: [
              (context.percentHeight * 10).heightBox,
              Icon(
                Icons.account_circle_rounded,
                size: 50.0,
              ),
              'shyam ganesh'.text.semiBold.make(),
              (context.percentHeight * 2).heightBox,
              VxDivider(width: 3.0, color: Vx.blue800),
              List(title: 'Change Password', icon: Icons.password_rounded),
              List(title: 'Notification', icon: Icons.notifications),
              List(title: 'History', icon: Icons.history_rounded),
              List(title: 'Bookmark', icon: Icons.bookmark),
              List(title: 'Language', icon: Icons.language_rounded),
              List(title: 'About us', icon: Icons.notes_rounded),
            ].vStack(
                alignment: MainAxisAlignment.start, axisSize: MainAxisSize.max),
          ).width(context.percentWidth * 30).make(),
          VxBox(
                  child: VxBox()
                      .bgImage(DecorationImage(
                          image: AssetImage('assets/jaguar.gif')))
                      .makeCentered())
              .hexColor('#a0a3a2')
              .width(context.percentWidth * 70)
              .make(),
        ].hStack())
            .make());
  }
}
