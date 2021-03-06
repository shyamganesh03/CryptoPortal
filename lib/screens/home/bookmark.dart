import 'package:browser/components/Button.dart';
import 'package:browser/components/Divider.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../data/datastores.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final storeController = Get.put(DataStore());
  final t14 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return [
      10.heightBox,
      LabelText(
        type: 'Mt',
        value: 'BOOKMARKS',
        color: storeController.fontcolor.value,
      ),
      10.heightBox,
      VxBox(
          child: HStack(
        [
          TextInput(
            controller: t14,
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
      storeController.firebasedata.length == 0 ||
              storeController.firebasedata[0].bookmark.length == 0
          ? LabelText(
                  type: 'Mt', value: 'NO bookmark AVAILABLE', color: Vx.white)
              .centered()
          : VxBox(
              child: ListView.builder(
                  itemCount: storeController.firebasedata.length == 0
                      ? 0
                      : storeController.firebasedata[0].bookmark.length,
                  itemBuilder: (context, index) {
                    return VStack([
                      VxBox(
                          child: HStack(
                        [
                          LabelText(
                                  type: 'Mt',
                                  value:
                                      storeController.firebasedata.length == 0
                                          ? ''
                                          : storeController
                                              .firebasedata[0].bookmark[index],
                                  color: storeController.fontcolor.value)
                              .centered(),
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
