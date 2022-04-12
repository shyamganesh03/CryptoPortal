import 'package:browser/components/List.dart';
import 'package:browser/components/RadioButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../components/Divider.dart';
import '../../components/LabelText.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/datastores.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String gvalue = 'English';
  bool isSwitched = false;
  final storeController = Get.put(DataStore());
  void toggleSwitch(bool value) {
    isSwitched = !isSwitched;
    setState(() {});
  }

  valueChange(value) {
    gvalue = value.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return [
      50.heightBox,
      LabelText(
              type: 'Mt',
              value: 'Current Bowser Language',
              color: storeController.fontcolor.value)
          .px(20),
      10.heightBox,
      VxBox(
        child: List(
          title: 'ENGLISH',
          icon: CupertinoIcons.globe,
          enabled: false,
          action: () {},
          id: 8,
        ),
      ).width(500).makeCentered(),
      20.heightBox,
      Div(),
      10.heightBox,
      LabelText(
              type: 'Mt',
              value: 'Available Bowser Language',
              color: storeController.fontcolor.value)
          .px(20),
      10.heightBox,
      VxBox(
          child: ListView(
        children: [
          10.heightBox,
          [
            VxBox(
              child: LabelText(
                  type: 'Mt',
                  value: 'ENGLISH',
                  color: storeController.fontcolor.value),
            ).width(200).make(),
            RadioButtons(
                theme: false,
                value: 'English',
                action: valueChange,
                description: '',
                gvalue: gvalue),
          ].hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly),
          10.heightBox,
          [
            VxBox(
              child: LabelText(
                  type: 'Mt',
                  value: 'TAMIL',
                  color: storeController.fontcolor.value),
            ).width(200).make(),
            RadioButtons(
                theme: false,
                value: 'Tamil',
                action: valueChange,
                description: '',
                gvalue: gvalue),
          ].hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly),
          10.heightBox,
          [
            VxBox(
              child: LabelText(
                  type: 'Mt',
                  value: 'HINDI',
                  color: storeController.fontcolor.value),
            ).width(200).make(),
            RadioButtons(
                theme: false,
                value: 'Hindi',
                action: valueChange,
                description: '',
                gvalue: gvalue),
          ].hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly),
          10.heightBox,
          [
            VxBox(
              child: LabelText(
                  type: 'Mt',
                  value: 'TELUNGU',
                  color: storeController.fontcolor.value),
            ).width(200).make(),
            RadioButtons(
                theme: false,
                value: 'Telungu',
                action: valueChange,
                description: '',
                gvalue: gvalue),
          ].hStack(
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly),
          10.heightBox,
        ],
      )).size(500, 210).make().px(context.safePercentWidth * 20),
      15.heightBox,
      Div(),
      10.heightBox,
      LabelText(
        type: 'Mt',
        value: 'Spell Check',
        color: storeController.fontcolor.value,
      ).px(20),
      (context.safePercentHeight * 2).heightBox,
      VxBox(
          child: List(
        title: 'Enable Spell Check',
        icon: Icons.abc,
        enabled: false,
        action: () {},
        id: 9,
        switchw: Switch(
          onChanged: toggleSwitch,
          value: isSwitched,
          activeColor: Colors.transparent,
          activeTrackColor: Vx.gray600,
          inactiveThumbColor: Vx.blue400,
          inactiveTrackColor: Vx.gray400,
        ),
      )).width(500).make().px(context.safePercentWidth * 20),
    ]
        .vStack(
            axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.start,
            crossAlignment: CrossAxisAlignment.start)
        .scrollVertical();
  }
}
