import 'dart:async';
import 'package:browser/components/LabelText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import '../../components/Button.dart';
import '../../components/TextField.dart';
import '../../data/datastores.dart';
import '../web/web.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String date = '';
  String time = '';
  String period = '';
  bool select = false;
  final storeController = Get.put(DataStore());
  final t1 = TextEditingController();
  final tf1 = TextEditingController();
  final tf2 = TextEditingController();

  @override
  void initState() {
    _getCurrentTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  onSearchIconClick(id) async {
    select = !select;
  }

  void _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy EEE').format(now);
    String formattedTime = DateFormat('hh:mm:ss').format(now);
    String formattedPeriod = DateFormat('a').format(now);
    setState(() {
      date = formattedDate;
      time = formattedTime;
      period = formattedPeriod;
    });
  }

  languagecode(language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Tamil':
        return 'ta';
      case 'Telugu':
        return 'te';
      case 'Hindi':
        return 'hi';
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return VStack([
      10.heightBox,
      VxBox(
              child: HStack(
        [
          (context.safePercentWidth * 24).widthBox,
          TextInput(
                  controller: t1,
                  obsecure: false,
                  label: 'search',
                  animated: select,
                  action: (value) => search(value))
              .animatedBox
              .linearToEaseOut
              .size(select == true ? 590 : 0, select == true ? 30 : 0)
              .animDuration(Duration(seconds: 2))
              .make(),
          20.widthBox,
          IButton(
            action: onSearchIconClick,
            icon: FontAwesomeIcons.magnifyingGlass,
            id: 8,
            enabled: false,
          ),
        ],
      ))
          .size(context.safePercentWidth * 95, context.safePercentHeight * 20)
          .make(),
      VxBox(
        child: HStack(
          [
            VxBox(
              child: VStack([
                HStack([
                  FittedBox(
                    child: LabelText(
                      type: 'Lt',
                      value: time,
                      color: storeController.fontcolor.value,
                    ).box.width(180).make(),
                  ),
                  LabelText(
                    type: 'Lt',
                    value: period,
                    color: storeController.fontcolor.value,
                  ),
                ]).px32(),
                HStack([
                  65.widthBox,
                  LabelText(
                    type: 'Mt',
                    value: date,
                    color: storeController.fontcolor.value,
                  ),
                ]),
              ]),
            ).size(350, 100).make(),
          ],
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.center,
        ),
      )
          .size(context.safePercentWidth * 95, context.safePercentHeight * 18)
          .make(),
      20.heightBox,
      VxBox(
          child: ExpansionTile(
              trailing: FaIcon(
                FontAwesomeIcons.bars,
                color: Vx.white,
              ),
              children: [
                HStack([
                  VxBox(
                      child: VStack([
                    DropDown(
                      items: ["English", "Tamil", "Telengu", "Hindi"],
                      customWidgets: [
                        "English".text.blue500.make(),
                        "Tamil".text.blue500.make(),
                        "Telugu".text.blue500.make(),
                        "Hindi".text.blue500.make(),
                      ],
                      hint: "Detect Language".text.blue500.make(),
                      showUnderline: false,
                      icon: Icon(
                        Icons.expand_more,
                        color: Colors.blue,
                      ),
                      onChanged: (value) {
                        storeController.updatetranslation(
                            languagecode(value), storeController.trdata[0].to);
                      },
                    ).px12(),
                    TextFormField(
                      controller: tf1,
                      maxLines: 10,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          label: 'Type Your Text Here'
                              .text
                              .blue500
                              .makeCentered()),
                      style: TextStyle(color: Vx.blue500),
                      onChanged: (value) => {
                        storeController.translation(value,tf2,tf1),
                      },
                    ).px(10)
                  ])).white.square(319.5).bottomLeftRounded(value: 20.0).make(),
                  (0.5).widthBox,
                  VxBox(
                          child: VStack([
                    HStack(
                      [
                        DropDown(
                          items: ["Tamil", "English", "Telegu", "Hindi"],
                          customWidgets: [
                            "Tamil".text.blue500.make(),
                            "English".text.blue500.make(),
                            "Telugu".text.blue500.make(),
                            "Hindi".text.blue500.make(),
                          ],
                          hint: "Language".text.blue500.make(),
                          showUnderline: false,
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.blue,
                          ),
                          onChanged: (value) => {
                            storeController.updatetranslation(
                              storeController.trdata[0].from,
                              languagecode(value),
                            )
                          },
                        ).px12(),
                      ],
                      axisSize: MainAxisSize.max,
                      alignment: MainAxisAlignment.end,
                    ),
                    TextFormField(
                      controller: tf2,
                      maxLines: 10,
                      readOnly: true,
                      // initialValue: storeController.trdata[0].translated_data,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // label: 'Translated Text'.text.blue500.makeCentered()
                      ),
                      style: TextStyle(color: Vx.blue500),
                    ).px(10)
                  ]))
                      .white
                      .square(319.5)
                      .bottomRightRounded(value: 20.0)
                      .make(),
                ])
              ],
              title: LabelText(
                type: 'dt',
                value: 'Translate',
                color: Vx.white,
              ))).blue500.width(640).withRounded(value: 20.0).makeCentered(),
    ]).scrollVertical();
  }

  search(url) {
    Get.to(() => SearchScreen(searchQuery: url));
  }
}
