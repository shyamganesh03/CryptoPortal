import 'package:browser/screens/auth/signup.dart';
import 'package:get/get.dart';

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

class MHome extends StatefulWidget {
  const MHome({Key? key}) : super(key: key);

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
    return Scaffold(
      body: ZStack([
        VxBox()
            .size(context.screenWidth, context.screenHeight)
            .bgImage(DecorationImage(
                image: AssetImage('assets/temp3.jpg'), fit: BoxFit.cover))
            .make(),
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
                  action: () => Get.to(() => Signup()),
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
    );
  }
}
