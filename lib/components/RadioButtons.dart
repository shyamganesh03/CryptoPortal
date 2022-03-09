import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:velocity_x/velocity_x.dart';

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    Key? key,
    required this.value,
    required this.action,
    required this.description,
    required this.gvalue,
    required this.theme,
  }) : super(key: key);
  final String value;
  final action;
  final String description;
  final String gvalue;
  final theme;
  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: [
      RadioButton(
        description: description,
        value: value,
        groupValue: gvalue,
        onChanged: (value) => action(value.toString()),
        activeColor: Vx.blue600,
        textStyle: TextStyle(fontSize: 20, color: Vx.white),
      ),
      if (theme == true)
        VxBox()
            .size(200, 100)
            .rounded
            .bgImage(DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg')))
            .makeCentered(),
    ].vStack())
        .make();
  }
}
