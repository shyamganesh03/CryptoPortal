import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LabelText extends StatelessWidget {
  const LabelText(
      {Key? key, required this.type, required this.value, this.textarea})
      : super(key: key);
  final type;
  final value;
  final textarea;
  Widget rendertext(String type, String value) {
    switch (type) {
      case 'Mt':
        if (textarea == true)
          return value.richText.white.bold.xl2
              .textStyle(TextStyle(
                decoration: TextDecoration.none,
              ))
              .align(TextAlign.justify)
              .make();
        else
          return value.richText.white.bold.xl2
              .textStyle(TextStyle(
                decoration: TextDecoration.none,
              ))
              .make();
      case 'Lt':
        return value.richText.white.extraBold.xl5
            .textStyle(TextStyle(
              decoration: TextDecoration.none,
            ))
            .make();
      default:
        return value.richText.white.xl.bold
            .textStyle(TextStyle(
              decoration: TextDecoration.none,
            ))
            .make();
    }
  }

  @override
  Widget build(BuildContext context) {
    return rendertext(type, value);
  }
}
