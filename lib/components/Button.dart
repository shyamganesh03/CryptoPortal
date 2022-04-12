import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'LabelText.dart';
import 'package:get/get.dart';
import '../data/datastores.dart';

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
   IButton(
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
  final storeController = Get.put(DataStore());
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
              if (id == 9)
                action()
              else if (id == 10)
                action('l')
              else if (id == 11)
                action('i')
              else
                action(id)
            },
        icon: FaIcon(
          icon,
          size: 20.0,
          color:storeController.iconcolor.value,
        ));
  }
}
