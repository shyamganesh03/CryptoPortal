import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      required this.label,
      required this.animated,
      required this.obsecure,
      this.icon})
      : super(key: key);
  final label;
  final animated;
  final icon;
  final obsecure;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: VxTextField(
        isPassword: obsecure,
        obscureText: obsecure,
        icon: icon,
        keyboardType: TextInputType.multiline,
        labelText: label,
        fillColor: Color(0x7A222020),
        style: TextStyle(
          color: Vx.white,
        ),
        labelStyle: TextStyle(
          color: Vx.white,
          fontSize: 12.0,
          letterSpacing: 2.0,
        ),
        borderRadius: 20.0,
        borderColor: animated == true ? Colors.blue : Colors.transparent,
        borderType: VxTextFieldBorderType.roundLine,
      ),
    ).make();
  }
}
