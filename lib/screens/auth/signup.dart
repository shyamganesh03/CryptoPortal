import 'package:browser/components/Button.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:browser/screens/auth/signin.dart';
import 'package:browser/screens/home/Mhome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZStack([
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
                  LabelText(type: 'Lt', value: 'Enter Login Credintial'),
                  HStack([
                    LabelText(type: 'dt', value: ' I Not Have an account?'),
                    10.heightBox,
                    TextButton(
                        onPressed: () => Get.to(() => Signin()),
                        child: 'Sign in'.text.blue600.xl.bold.make())
                  ]),
                  35.heightBox,
                  TextInput(
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
                    obsecure: true,
                    label: 'Password',
                    animated: true,
                    icon: FaIcon(
                      FontAwesomeIcons.userLock,
                      color: Vx.white,
                    ),
                  ).box.size(415, 35).make(),
                  25.heightBox,
                  Button(label: 'Submit', action: () => Get.to(() => MHome()))
                ],
                axisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.start,
                crossAlignment: CrossAxisAlignment.center,
              ).scrollVertical())
                  .width(450)
                  .make(),
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
                  .width(450)
                  .make(),
            ],
          )).black.size(900, 500).make(),
        ).shadowColor(Colors.white12).elevation(10).roundedLg.makeCentered()
      ]),
    );
  }
}
