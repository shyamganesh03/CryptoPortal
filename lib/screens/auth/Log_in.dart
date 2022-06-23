import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:browser/components/Button.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:browser/screens/auth/signin.dart';
import 'package:browser/screens/home/Mhome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/Alert.dart';
import '../../data/datastores.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final t7 = TextEditingController();
  final t8 = TextEditingController();
  final storeController = Get.put(DataStore());

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ]))
              .linearGradient([Vx.black, Vx.blue200],
                  stops: [0.5, 1.0],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)
              .size(context.screenWidth, 30)
              .make()
              .material(elevation: 5.0),
          VxBox(
            child: ZStack([
              VxBox().linearGradient([Vx.black, Vx.blue200],
                  stops: [0.6, 1.0],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight).make(),
              VxCard(
                VxBox(
                    child: HStack(
                  [
                    VxBox(
                            child: VStack(
                      [
                        LabelText(
                          type: 'Lt',
                          value: 'Enter Login Credintial',
                          color: Vx.white,
                        ),
                        HStack([
                          LabelText(
                            type: 'dt',
                            value: ' I Not Have an account?',
                            color: Vx.white,
                          ),
                          10.heightBox,
                          TextButton(
                              onPressed: () => Get.to(() => Signin()),
                              child: LabelText(
                                  type: 'dt',
                                  value: 'Sign In',
                                  color: Vx.blue600))
                        ]),
                        35.heightBox,
                        TextInput(
                          controller: t7,
                          obsecure: false,
                          label: 'Email-Id',
                          animated: true,
                          icon: FaIcon(
                            FontAwesomeIcons.at,
                            color: Vx.white,
                          ),
                        ).box.size(415, 35).make(),
                        25.heightBox,
                        TextInput(
                          controller: t8,
                          obsecure: true,
                          label: 'Password',
                          animated: true,
                          icon: FaIcon(
                            FontAwesomeIcons.userLock,
                            color: Vx.white,
                          ),
                        ).box.size(415, 35).make(),
                        25.heightBox,
                        Button(
                            label: 'Submit',
                            action: () async {
                              try {
                                await storeController.userLogin(
                                    t7.text, t8.text);
                                storeController.getuserdata();
                                Get.to(() => MHome());
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Alert(
                                        type: 'error',
                                        content:
                                            'CHECK YOUR EMAIL AND PASSWORD',
                                      );
                                    });
                              }
                            })
                      ],
                      axisSize: MainAxisSize.max,
                      alignment: MainAxisAlignment.start,
                      crossAlignment: CrossAxisAlignment.center,
                    ).scrollVertical())
                        .width(450)
                        .make()
                        .p(10),
                    VxBox(
                            child: VStack(
                      [
                        400.heightBox,
                        HStack(
                          [
                            FaIcon(
                              FontAwesomeIcons.chrome,
                              color: Vx.white,
                              size: 50.0,
                            )
                          ],
                          axisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.end,
                        )
                      ],
                      axisSize: MainAxisSize.max,
                      alignment: MainAxisAlignment.end,
                    ).scrollVertical().px(30))
                        .width(430)
                        .make(),
                  ],
                )).black.size(900, 500).make(),
              )
                  .shadowColor(Colors.white12)
                  .elevation(10)
                  .roundedLg
                  .makeCentered()
            ]),
          ).make().expand(),
        ]),
      ),
    );
  }
}
