import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/List.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: VxBox(
              child: [
        VxBox(
                child: [
          List(title: 'SETTINGS', icon: Icons.settings),
          (context.percentHeight * 5).heightBox,
          Icon(
            Icons.account_circle_rounded,
            size: 50.0,
          ),
          'shyam ganesh'.text.semiBold.make(),
          (context.percentHeight * 2).heightBox,
          VxDivider(
            width: 2.0,
          ),
          List(title: 'Change password', icon: Icons.password_rounded),
          List(title: 'Notification', icon: Icons.notifications),
          List(title: 'History', icon: Icons.history),
          List(title: 'BookMark', icon: Icons.bookmark),
          List(title: 'Language', icon: Icons.language),
          List(title: 'Notes', icon: Icons.notes),
        ].vStack())
            .blueGray100
            .width(context.percentWidth * 30)
            .height(context.percentHeight * 100)
            .make(),
        VxBox()
            .width(context.percentWidth * 70)
            .height(context.percentHeight * 100)
            .green200
            .make(),
      ].hStack(axisSize: MainAxisSize.max, alignment: MainAxisAlignment.start))
          .make(),
    );
  }
}
