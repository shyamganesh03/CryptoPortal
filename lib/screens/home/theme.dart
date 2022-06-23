import 'package:browser/components/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/Divider.dart';
import '../../components/LabelText.dart';
import '../../data/datastores.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  final storeController = Get.put(DataStore());
  String gvalue = 'Light Theme';
  double slidervalue = 20.0;
  List<String> fonts = ['Roboto', 'Open Sans', 'Lato', 'Montserrat'];
  String font = 'Roboto';
  ScrollController cv1 = ScrollController();
  ScrollController cv2 = ScrollController();
  ScrollController ch1 = ScrollController();
  var tempColor;
  String type = '';
  radiovalue(value) {
    setState(() {
      gvalue = value.toString();
    });
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('SUBMIT'),
              onPressed: () {
                if (type == 'l') {
                  storeController.updateFontColor(tempColor);
                } else
                  storeController.updateIconColor(tempColor);
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker(String typename) async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: storeController.fontcolor.value,
        onColorChange: (color) =>
            setState(() => {tempColor = color, type = typename}),
        onMainColorChange: (color) {},
        onBack: () => print("Back button pressed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        80.heightBox,
        HStack(
          [
            LabelText(
              type: 'Mt',
              value: 'Font Family',
              color: storeController.fontcolor.value,
            ).px(20),
            LabelText(
              type: 'Mt',
              value: 'Current Font: ${font}',
              color: storeController.fontcolor.value,
            ).px(20),
          ],
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.spaceBetween,
        ),
        10.heightBox,
        ListView.builder(
            itemCount: fonts.length,
            itemBuilder: (context, index) {
              return VxBox(
                      child: LabelText(
                type: 'Mt',
                value: fonts[index],
                color: storeController.fontcolor.value,
              ).centered())
                  .size(300, 100)
                  .make()
                  .onTap(() {
                font = fonts[index];
                storeController.updateFontName(fonts[index]);
                setState(() {});
              });
            }).box.size(context.screenWidth, 200).make(),
        12.heightBox,
        Div(),
        12.heightBox,
        VxBox(
          child: VStack(
            [
              HStack(
                [
                  LabelText(
                      type: 'Mt',
                      value: 'FontColor:',
                      color: storeController.fontcolor.value),
                  IButton(
                      action: _openColorPicker,
                      icon: FontAwesomeIcons.a,
                      id: 10,
                      )
                ],
                axisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.spaceAround,
              ),
              HStack(
                [
                  LabelText(
                      type: 'Mt',
                      value: 'IconColor:',
                      color: storeController.fontcolor.value),
                  IButton(
                      action: _openColorPicker,
                      icon: FontAwesomeIcons.i,
                      id: 11,
                      )
                ],
                axisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.spaceAround,
              ),
            ],
            axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.center,
            crossAlignment: CrossAxisAlignment.center,
          ),
        ).height(100).width(context.safePercentWidth * 95).make()
      ],
      axisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.start,
    ).scrollVertical(controller: cv2);
  }
}
