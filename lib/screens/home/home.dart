import 'dart:async';
import 'package:browser/components/LabelText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import '../../components/Button.dart';
import '../../components/TextField.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String date = '';
  String time = '';
  bool select = false;
  late Timer timer;
  @override
  void initState() {
    _getCurrentTime();
    if (!mounted)
      timer =
          Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  onSearchIconClick(id) {
    select = !select;
    setState(() {});
  }

  void _getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy EEEE').format(now);
    String formattedTime = DateFormat('hh:mm:ss a').format(now);
    setState(() {
      date = formattedDate;
      time = formattedTime;
    });
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
            obsecure: false,
            label: 'search',
            animated: select,
          )
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
            VStack([
              LabelText(
                type: 'Lt',
                value: time,
              ).px32(),
              HStack([
                60.widthBox,
                LabelText(
                  type: 'Mt',
                  value: date,
                ),
              ]),
            ]),
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
                          onChanged: print,
                        ).px12(),
                        TextFormField(
                          maxLines: 10,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              label: 'Type Your Text Here'
                                  .text
                                  .blue500
                                  .makeCentered()),
                          style: TextStyle(color: Vx.blue500),
                        ).px(10)
                      ]))
                          .white
                          .square(319.5)
                          .bottomLeftRounded(value: 20.0)
                          .make(),
                      (0.5).widthBox,
                      VxBox(
                              child: VStack([
                        HStack(
                          [
                            DropDown(
                              items: ["English", "Tamil", "Telegu", "Hindi"],
                              customWidgets: [
                                "English".text.blue500.make(),
                                "Tamil".text.blue500.make(),
                                "Telugu".text.blue500.make(),
                                "Hindi".text.blue500.make(),
                              ],
                              hint: "Language".text.blue500.make(),
                              showUnderline: false,
                              icon: Icon(
                                Icons.expand_more,
                                color: Colors.blue,
                              ),
                              onChanged: print,
                            ).px12(),
                          ],
                          axisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.end,
                        ),
                        TextFormField(
                          maxLines: 10,
                          readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              label: 'Translated Text'
                                  .text
                                  .blue500
                                  .makeCentered()),
                          style: TextStyle(color: Vx.blue500),
                        ).px(10)
                      ]))
                          .white
                          .square(319.5)
                          .bottomRightRounded(value: 20.0)
                          .make(),
                    ])
                  ],
                  title: LabelText(type: 'dt', value: 'Translate')))
          .blue500
          .width(640)
          .withRounded(value: 20.0)
          .makeCentered(),
    ]).scrollVertical();
  }
}
