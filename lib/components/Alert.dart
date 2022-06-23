import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Button.dart';
import 'LabelText.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key, required this.type, required this.content})
      : super(key: key);
  final type;
  final content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Vx.purple400,
      title: LabelText(
        type: 'Mt',
        value: (type == 'error' || type == 'errorS')
            ? 'ERROR OCCURRED'
            : 'INFORMATION',
        color: (type == 'error' || type == 'errorS') ? Vx.red700 : Vx.green700,
      ),
      content: VStack([
        LabelText(
          type: 'Mt',
          value: content,
          color: Vx.blue700,
        ).centered(),
        if (type == 'errorS')
          LabelText(
            type: 'Mt',
            value: 'Available Colors are',
            color: Vx.blue700,
          ).centered(),
        if (type == 'errorS')
          LabelText(
            type: 'Mt',
            value: 'BLUE',
            color: Colors.blue,
          ).centered(),
        if (type == 'errorS')
          LabelText(
            type: 'Mt',
            value: 'RED',
            color: Colors.red,
          ).centered(),
        if (type == 'errorS')
          LabelText(
            type: 'Mt',
            value: 'GREEN',
            color: Colors.green,
          ).centered(),
        if (type == 'errorS')
          LabelText(
            type: 'Mt',
            value: 'WHITE',
            color: Colors.white,
          ).centered(),
      ]),
      actions: [
        Button(label: 'OK', action: () => Navigator.pop(context)),
      ],
    );
  }
}
