import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Div extends StatelessWidget {
  const Div({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxDivider(
      color: Vx.teal100,
    ).shimmer();
  }
}
