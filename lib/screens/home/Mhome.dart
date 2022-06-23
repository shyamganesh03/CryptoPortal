import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:browser/screens/auth/Log_in.dart';
import 'package:get/get.dart';
import '../../components/Alert.dart';
import '../../data/datastores.dart';
import '../auth/signin.dart';
import '../web/web.dart';
import './bookmark.dart';
import './Language.dart';
import './downloads.dart';
import './history.dart';
import './home.dart';
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
  final storeController = Get.put(DataStore());
  var a = false;

  Widget render(value) {
    switch (value) {
      case 1:
        return Home();
      case 2:
        return Themes();
      case 4:
        return Bookmark();
      case 5:
        return History();
      case 6:
        return Download();
      case 7:
        return Language();
      default:
        return Home();
    }
  }

  @override
  void initState() {
    super.initState();
    // initialspeech();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('dependencies change');
    // Get.lazyPut(() => StoreController();)
  }

  page(value) {
    storeController.changePage(value);
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
      backgroundColor: storeController.navigation.value != 7
          ? Color.fromRGBO(52, 123, 163, 1)
          : Colors.transparent, //52, 123, 163
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
              Obx((() => storeController.navigation.value != 20
                  ? HStack([
                      VxBox(
                              child: VStack(
                        [
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.solidBuilding,
                            id: 1,
                          ),
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.brush,
                            id: 2,
                          ),
                          IButton(
                            action: () async {
                              if (storeController.firebasedata[0].emailid !=
                                  null) {
                                await storeController.updatepassword();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Alert(
                                        type: 'information',
                                        content:
                                            'CHECK YOUR MAIL FOR PASSWORD CHANGE',
                                      );
                                    });
                              }
                            },
                            icon: FontAwesomeIcons.lock,
                            id: 3,
                          ),
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.bookBookmark,
                            id: 4,
                          ),
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.clockRotateLeft,
                            id: 5,
                          ),
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.download,
                            id: 6,
                          ),
                          IButton(
                            action: page,
                            icon: FontAwesomeIcons.language,
                            id: 7,
                          ),
                          IButton(
                            action: () => Get.to(() => Signin()),
                            icon: FontAwesomeIcons.user,
                            id: 12,
                          ),
                          IButton(
                            action: () => {
                              storeController.firebasedata.clear(),
                              Get.to(() => LogIn()),
                            },
                            icon: FontAwesomeIcons.arrowUpFromBracket,
                            id: 9,
                          )
                        ],
                        axisSize: MainAxisSize.max,
                        alignment: MainAxisAlignment.spaceEvenly,
                        crossAlignment: CrossAxisAlignment.center,
                      ))
                          .size(context.safePercentWidth * 4,
                              context.screenHeight)
                          .make()
                          .material(elevation: 5.0, color: Colors.transparent),
                      VxBox(
                              child: Obx(() =>
                                  render(storeController.navigation.value)))
                          .size(context.safePercentWidth * 95,
                              context.screenHeight)
                          .make(),
                    ])
                  : SearchScreen(
                      searchQuery: storeController.searchquerry.value,
                    )))
            ]),
          ).make().expand(),
        ]),
      ),
    );
  }
}
