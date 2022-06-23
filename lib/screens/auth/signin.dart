import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:browser/components/Button.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/Alert.dart';
import '../../data/datastores.dart';
import 'Log_in.dart';

//
class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();
  final t5 = TextEditingController();
  final t6 = TextEditingController();
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
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                          type: 'dt',
                          value: 'START FOR FREE',
                          color: Vx.white,
                        ),
                        LabelText(
                          type: 'Lt',
                          value: 'Create new account',
                          color: Vx.white,
                        ),
                        HStack([
                          LabelText(
                            type: 'dt',
                            value: 'Already Have an account?',
                            color: Vx.white,
                          ),
                          10.heightBox,
                          TextButton(
                              onPressed: () => Get.to(() => LogIn()),
                              child: LabelText(
                                type: 'dt',
                                value: 'Log In',
                                color: Vx.blue600,
                              ))
                        ]),
                        40.heightBox,
                        HStack([
                          TextInput(
                            obsecure: false,
                            label: 'First name',
                            animated: true,
                            controller: t2,
                            icon: FaIcon(
                              FontAwesomeIcons.idCard,
                              color: Vx.white,
                            ),
                          ).box.size(200, 35).make(),
                          15.widthBox,
                          TextInput(
                            controller: t3,
                            obsecure: false,
                            label: 'Last name',
                            animated: true,
                            icon: FaIcon(
                              FontAwesomeIcons.idCard,
                              color: Vx.white,
                            ),
                          ).box.size(200, 35).make(),
                        ]),
                        15.heightBox,
                        TextInput(
                          controller: t4,
                          obsecure: false,
                          label: 'Email-Id',
                          animated: true,
                          icon: FaIcon(
                            FontAwesomeIcons.at,
                            color: Vx.white,
                          ),
                        ).box.size(415, 35).make(),
                        15.heightBox,
                        TextInput(
                          controller: t5,
                          obsecure: true,
                          label: 'Password',
                          animated: true,
                          icon: FaIcon(
                            FontAwesomeIcons.userLock,
                            color: Vx.white,
                          ),
                        ).box.size(415, 35).make(),
                        15.heightBox,
                        TextInput(
                          controller: t6,
                          obsecure: true,
                          label: 'Re-Enter Password',
                          animated: true,
                          icon: FaIcon(
                            FontAwesomeIcons.userLock,
                            color: Vx.white,
                          ),
                        ).box.size(415, 35).make(),
                        20.heightBox,
                        Button(
                            label: 'Create',
                            action: () async {
                              try {
                                if (t5.text == t6.text) {
                                  storeController.newuser(
                                      t4.text, t5.text, t2.text, t3.text);
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Alert(
                                          type: 'error',
                                          content: 'PASSWOARD NOT MATCH',
                                        );
                                      });
                                }
                              } catch (e) {
                                print(e);
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
