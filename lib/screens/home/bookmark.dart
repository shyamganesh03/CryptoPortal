import 'package:browser/components/Button.dart';
import 'package:browser/components/Divider.dart';
import 'package:browser/components/LabelText.dart';
import 'package:browser/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return [
      10.heightBox,
      LabelText(
        type: 'Mt',
        value: 'BOOKMARKS',
        color: Vx.white,
      ),
      10.heightBox,
      VxBox(
          child: HStack(
        [
          TextInput(
            obsecure: false,
            label: 'SEARCH',
            animated: true,
          ).box.size(500, 30).make(),
          IButton(
              action: () {},
              icon: FontAwesomeIcons.filter,
              id: 9,
              enabled: false)
        ],
        axisSize: MainAxisSize.max,
        alignment: MainAxisAlignment.center,
      )).size(600, 60).make(),
      20.heightBox,
      Div(),
      20.heightBox,
      VxBox(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return VStack([
                  VxBox(
                      child: HStack(
                    [
                      10.widthBox,
                      VxBox()
                          .bgImage(DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
                              )))
                          .size(100, 80)
                          .rounded
                          .make(),
                      100.widthBox,
                      LabelText(
                              type: 'Mt',
                              value: 'WEBSITE NAME',
                              color: Vx.white)
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
    ].vStack(alignment: MainAxisAlignment.start, axisSize: MainAxisSize.max);
  }
}
