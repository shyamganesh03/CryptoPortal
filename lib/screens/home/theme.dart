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
  List<String> fonts = ['Roboto', 'Open Sans', 'Lato', 'Montserrat'];
  String font = 'Roboto';
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
        LabelText(
          type: 'Mt',
          value: 'Appearence',
          color: Vx.white,
        ).px(20),
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
        LabelText(
          type: 'Mt',
          value: 'Font Size',
          color: Vx.white,
        ).px(20),
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
        HStack(
          [
            LabelText(
              type: 'Mt',
              value: 'Font Family',
              color: Vx.white,
            ).px(20),
            LabelText(
              type: 'Mt',
              value: 'Current Font: ${font}',
              color: Vx.white,
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
                color: Vx.white,
              ).centered())
                  .size(300, 100)
                  .make()
                  .onTap(() {
                font = fonts[index];
                setState(() {});
              });
            }).box.size(context.screenWidth, 200).make()
      ],
      axisSize: MainAxisSize.max,
      alignment: MainAxisAlignment.start,
    ).scrollVertical(controller: cv2);
  }
}
