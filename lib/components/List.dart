import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class List extends StatelessWidget {
  const List({Key? key, @required this.title, @required this.icon})
      : super(key: key);
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: title.toString().text.make(),
      trailing: Icon(icon),
    );
  }
}
