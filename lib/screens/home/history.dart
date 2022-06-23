import 'package:browser/components/Divider.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:browser/data/datastores.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/Button.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final storeController = Get.put(DataStore());
  final t12 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return [
      10.heightBox,
      LabelText(
        type: 'Mt',
        value: 'SEARCH HISTORY',
        color: storeController.fontcolor.value,
      ),
      10.heightBox,
      VxBox(
          child: HStack(
        [
          TextInput(
            controller: t12,
            obsecure: false,
            label: 'SEARCH',
            animated: true,
          ).box.size(500, 30).make(),
          IButton(
            action: () {},
            icon: FontAwesomeIcons.filter,
            id: 9,
          )
        ],
        axisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.center,
      )).size(600, 60).make(),
      20.heightBox,
      Div(),
      20.heightBox,
      storeController.firebasedata == []
          ? LabelText(
                  type: 'Mt', value: 'NO HISTORY AVAILABLE', color: Vx.blue400)
              .centered()
          : VxBox(
              child: ListView.builder(
                  itemCount: storeController.firebasedata[0].history.length,
                  itemBuilder: (context, index) {
                    return VStack([
                      VxBox(
                          child: HStack(
                        [
                          LabelText(
                            type: 'Mt',
                            value:
                                storeController.firebasedata[0].history[index],
                            color: storeController.fontcolor.value,
                          ).centered(),
                          150.widthBox,
                          FaIcon(
                            FontAwesomeIcons.shareNodes,
                            color: Vx.blue400,
                          )
                        ],
                      )).size(600, 100).make(),
                      20.heightBox,
                    ]);
                  })).size(600, 550).make()
    ]
        .vStack(alignment: MainAxisAlignment.start, axisSize: MainAxisSize.max)
        .scrollVertical();
  }
}
