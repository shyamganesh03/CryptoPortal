import 'package:browser/components/RadioButtons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../components/Divider.dart';
import '../../components/LabelText.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  String gvalue = 'Light Theme';
  double slidervalue = 20.0;
  ScrollController cv1 = ScrollController();
  ScrollController cv2 = ScrollController();
  ScrollController ch1 = ScrollController();
  radiovalue(value) {
    setState(() {
      gvalue = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        10.heightBox,
        LabelText(type: 'Mt', value: 'Appearence').px(20),
        10.heightBox,
        HStack(
          [
            60.widthBox,
            RadioButtons(
                theme: true,
                value: 'Light Theme',
                action: radiovalue,
                description: 'Light Theme',
                gvalue: gvalue),
            100.widthBox,
            RadioButtons(
                theme: true,
                value: 'Dark Theme',
                action: radiovalue,
                description: 'Dark Theme',
                gvalue: gvalue),
            10.heightBox,
          ],
        )
            .scrollHorizontal(controller: ch1)
            .box
            .size(650, 150)
            .blue200
            .rounded
            .makeCentered()
            .px(200),
        12.heightBox,
        Div(),
        10.heightBox,
        LabelText(type: 'Mt', value: 'Font Size').px(20),
        12.heightBox,
        SfSlider(
          min: 0.0,
          max: 50.0,
          value: slidervalue,
          interval: 5,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 1,
          thumbIcon: Icon(
            Icons.translate_rounded,
            size: 12.0,
            color: Vx.white,
          ),
          onChanged: (dynamic value) {
            setState(() {
              slidervalue = value;
            });
          },
        ).box.size(500, 90).makeCentered(),
        15.heightBox,
        Div(),
        12.heightBox,
        LabelText(type: 'Mt', value: 'Font Family').px(20),
        10.heightBox,
        VxBox(
            child: VStack([
          VxBox(
                  child: LabelText(
            type: 'Mt',
            value: 'Font 1',
          ).centered())
              .size(300, 100)
              .make(),
          10.heightBox,
          VxBox(
                  child: LabelText(
            type: 'Mt',
            value: 'Font 2',
          ).centered())
              .size(300, 100)
              .make(),
          10.heightBox,
          VxBox(
                  child: LabelText(
            type: 'Mt',
            value: 'Font 3',
          ).centered())
              .size(300, 100)
              .make(),
          10.heightBox,
          VxBox(
                  child: LabelText(
            type: 'Mt',
            value: 'Font 4',
          ).centered())
              .size(300, 100)
              .make(),
          10.heightBox,
        ]).scrollVertical(
          controller: cv1,
        )).size(500, 300).makeCentered().px(250),
      ],
      axisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.start,
    ).scrollVertical(controller: cv2);
  }
}
