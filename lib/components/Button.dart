import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'LabelText.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.label,
    required this.action,
  }) : super(key: key);
  final label;
  final action;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      child: LabelText(
        type: 'dt',
        value: label,
        color: Vx.white,
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ))),
    ).box.size(200, 40).make();
  }
}

class IButton extends StatelessWidget {
  const IButton(
      {Key? key,
      required this.action,
      required this.icon,
      required this.id,
      required this.enabled})
      : super(key: key);
  final id;
  final action;
  final icon;
  final enabled;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => id == 9 ? action() : action(id),
        icon: FaIcon(
          icon,
          size: 20.0,
        ));
  }
}
