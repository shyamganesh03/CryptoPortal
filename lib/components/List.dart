import 'LabelText.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class List extends StatelessWidget {
  const List({
    Key? key,
    @required this.title,
    @required this.icon,
    @required this.enabled,
    @required this.action,
    @required this.id,
    this.radiovalue,
    this.fun,
    this.gvalue,
    this.switchw,
  }) : super(key: key);
  final title;
  final icon;
  final enabled;
  final action;
  final id;

  final radiovalue;
  final fun;
  final gvalue;
  final switchw;
  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: id == 8
                ? IconButton(
                    onPressed: () {
                      action(id);
                    },
                    icon: Icon(
                      icon,
                      color: Vx.blue700,
                    ))
                : context.safePercentWidth < 5.74
                    ? ''.text.make()
                    : LabelText(type: 'Mt', value: title,color: Vx.white,),
            title: id == 8
                ? LabelText(type: 'Mt', value: title,color: Vx.white,)
                : context.safePercentWidth < 5.74
                    ? IconButton(
                        onPressed: () {
                          action(id);
                        },
                        icon: Icon(
                          icon,
                          color: Vx.blue700,
                        ))
                    : ''.text.make(),
            trailing: id == 8
                ? ''.text.make()
                : id == 9
                    ? switchw
                    : context.safePercentWidth < 5.74
                        ? ''.text.make()
                        : IconButton(
                            onPressed: () {
                              action(id);
                            },
                            icon: Icon(
                              icon,
                              color: Vx.blue700,
                            )))
        .opacity(value: enabled ? 0.8 : 1.0);
  }
}
