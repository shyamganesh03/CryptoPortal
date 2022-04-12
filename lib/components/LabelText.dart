import 'package:browser/data/datastores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LabelText extends StatelessWidget {
  LabelText({
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
  DataStore store = Get.put(DataStore());

  fontfamily(String name) {
    switch (name) {
      case 'Roboto':
        return GoogleFonts.roboto(
            textStyle:
                TextStyle(decoration: TextDecoration.none, color: color));
      case 'Open Sans':
        return GoogleFonts.openSans(
            textStyle:
                TextStyle(decoration: TextDecoration.none, color: color));
      case 'Lato':
        return GoogleFonts.lato(
            textStyle:
                TextStyle(decoration: TextDecoration.none, color: color));
      case 'Montserrat':
        return GoogleFonts.montserrat(
            textStyle:
                TextStyle(decoration: TextDecoration.none, color: color));
      default:
    }
  }

  Widget rendertext(String type, String value) {
    switch (type) {
      case 'Mt':
        if (textarea == true)
          return value.richText.bold.xl2
              .textStyle(fontfamily(store.font_name.value))
              .align(TextAlign.justify)
              .make();
        else
          return value.richText.bold.xl2
              .textStyle(fontfamily(store.font_name.value))
              .make();
      case 'Lt':
        return value.richText.extraBold.xl5
            .textStyle(fontfamily(store.font_name.value))
            .make();
      default:
        return value.richText.xl.bold
            .textStyle(fontfamily(store.font_name.value))
            .make();
    }
  }

  @override
  Widget build(BuildContext context) {
    return rendertext(type, value);
  }
}
