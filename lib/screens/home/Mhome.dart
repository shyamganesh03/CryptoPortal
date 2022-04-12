import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:browser/screens/auth/Log_in.dart';
import 'package:get/get.dart';
import '../../data/datastores.dart';
import './bookmark.dart';
import './Language.dart';
import './downloads.dart';
import './history.dart';
import './home.dart';
import './password.dart';
import './theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/Button.dart';

// ignore: must_be_immutable
class MHome extends StatefulWidget {
  MHome({Key? key}) : super(key: key);
  @override
  State<MHome> createState() => _MHomeState();
}

class _MHomeState extends State<MHome> {
  bool enable1 = false,
      enable2 = false,
      enable3 = false,
      enable4 = false,
      enable5 = false,
      enable6 = false,
      enable7 = false;
  final storeController = Get.put(DataStore());
  clicked(id) {
    switch (id) {
      case 1:
        enable1 = true;
        enable2 = false;
        enable3 = false;
        enable4 = false;
        enable5 = false;
        enable6 = false;
        enable7 = false;
        setState(() {});
        break;
      case 2:
        enable1 = false;
        enable2 = true;
        enable3 = false;
        enable4 = false;
        enable5 = false;
        enable6 = false;
        enable7 = false;
        setState(() {});
        break;
      case 3:
        enable1 = false;
        enable2 = false;
        enable3 = true;
        enable4 = false;
        enable5 = false;
        enable6 = false;
        enable7 = false;
        setState(() {});
        break;
      case 4:
        enable1 = false;
        enable2 = false;
        enable3 = false;
        enable4 = true;
        enable5 = false;
        enable6 = false;
        enable7 = false;
        setState(() {});
        break;
      case 5:
        enable1 = false;
        enable2 = false;
        enable3 = false;
        enable4 = false;
        enable5 = true;
        enable6 = false;
        enable7 = false;
        setState(() {});
        break;
      case 6:
        enable1 = false;
        enable2 = false;
        enable3 = false;
        enable4 = false;
        enable5 = false;
        enable6 = true;
        enable7 = false;
        setState(() {});
        break;
      case 7:
        enable1 = false;
        enable2 = false;
        enable3 = false;
        enable4 = false;
        enable5 = false;
        enable6 = false;
        enable7 = true;
        setState(() {});
        break;
      default:
    }
  }

  Widget render() {
    if (enable1 == true)
      return Home();
    else if (enable2 == true)
      return Themes();
    else if (enable3 == true)
      return Password();
    else if (enable4 == true)
      return Bookmark();
    else if (enable5 == true)
      return History();
    else if (enable6 == true)
      return Download();
    else if (enable7 == true)
      return Language();
    else
      return Home();
  }

  @override
  Widget build(BuildContext context) {
    final buttonColors = WindowButtonColors(
        iconNormal: Colors.white,
        mouseOver: Colors.black,
        mouseDown: Color(0xFF805306),
        iconMouseOver: Colors.white,
        iconMouseDown: Color(0xFFFFD500));

    final closeButtonColors = WindowButtonColors(
        mouseOver: Color(0xFFD32F2F),
        mouseDown: Color(0xFFB71C1C),
        iconNormal: Colors.white,
        iconMouseOver: Colors.white);
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 123, 163, 1), //52, 123, 163
      body: WindowBorder(
        color: Vx.blue500,
        width: 1,
        child: VStack([
          VxBox(
              child: HStack([
            VxBox(child: MoveWindow()).make().expand(),
            WindowTitleBarBox(
                child: [
              MinimizeWindowButton(colors: buttonColors),
              MaximizeWindowButton(colors: buttonColors),
              CloseWindowButton(colors: closeButtonColors),
            ].hStack()),
          ])).blue200.size(context.screenWidth, 30).make(),
          VxBox(
            child: ZStack([
              // VxBox()
              //     .width(context.screenWidth)
              //     .bgImage(DecorationImage(
              //         image: AssetImage('assets/images/temp3.jpg'),
              //         fit: BoxFit.cover))
              //     .make(),
              HStack([
                VxBox(
                        child: VStack(
                  [
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.solidBuilding,
                      id: 1,
                      enabled: enable1,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.brush,
                      id: 2,
                      enabled: enable2,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.lock,
                      id: 3,
                      enabled: enable3,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.bookBookmark,
                      id: 4,
                      enabled: enable4,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.clockRotateLeft,
                      id: 5,
                      enabled: enable5,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.download,
                      id: 6,
                      enabled: enable6,
                    ),
                    IButton(
                      action: clicked,
                      icon: FontAwesomeIcons.language,
                      id: 7,
                      enabled: enable7,
                    ),
                    IButton(
                        action: () => Get.to(() => LogIn()),
                        icon: FontAwesomeIcons.user,
                        id: 12,
                        enabled: true),
                    IButton(
                        action: () => Get.to(() => LogIn()),
                        icon: FontAwesomeIcons.arrowUpFromBracket,
                        id: 9,
                        enabled: true)
                  ],
                  axisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.spaceEvenly,
                  crossAlignment: CrossAxisAlignment.center,
                ))
                    .size(context.safePercentWidth * 4, context.screenHeight)
                    .make()
                    .material(elevation: 5.0, color: Colors.transparent),
                VxBox(child: render())
                    .size(context.safePercentWidth * 95, context.screenHeight)
                    .make(),
              ]),
            ]),
          ).make().expand(),
        ]),
      ),
    );
  }
}
