import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.type,
    required this.value,
    required this.color,
    this.textarea,
  }) : super(key: key);
  final type;
  final value;
  final textarea;
  final color;
  Widget rendertext(String type, String value) {
    switch (type) {
      case 'Mt':
        if (textarea == true)
          return value.richText.bold.xl2
              .textStyle(GoogleFonts.robotoSlab(
                  textStyle:
                      TextStyle(decoration: TextDecoration.none, color: color)))
              .align(TextAlign.justify)
              .make();
        else
          return value.richText.bold.xl2
              .textStyle(GoogleFonts.robotoSlab(
                  textStyle:
                      TextStyle(decoration: TextDecoration.none, color: color)))
              .make();
      case 'Lt':
        return value.richText.extraBold.xl5
            .textStyle(GoogleFonts.robotoSlab(
                textStyle:
                    TextStyle(decoration: TextDecoration.none, color: color)))
            .make();
      default:
        return value.richText.xl.bold
            .textStyle(GoogleFonts.robotoSlab(
                textStyle:
                    TextStyle(decoration: TextDecoration.none, color: color)))
            .make();
    }
  }

  @override
  Widget build(BuildContext context) {
    return rendertext(type, value);
  }
}
