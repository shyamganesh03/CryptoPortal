import 'package:browser/components/Button.dart';
import 'package:browser/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/LabelText.dart';
import '../../data/datastores.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final t9 = TextEditingController();
  final t10 = TextEditingController();
  final t11 = TextEditingController();
  bool verified = false;
  final storeController = Get.put(DataStore());
  Widget resetPassword() {
    return VxBox(
            child: [
      TextInput(
        obsecure: false,
        label: 'ENTER YOUR NEW PASSWORD',
        animated: true,
        controller: t9,
      ),
      TextInput(
        obsecure: false,
        label: 'RE ENTER YOUR PASSWORD',
        animated: true,
        controller: t10,
      ),
    ].vStack(
                axisSize: MainAxisSize.max,
                alignment: MainAxisAlignment.spaceEvenly))
        .height(context.safePercentHeight * 20)
        .make();
  }

  cliked() async {
    setState(() {
      verified = !verified;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: [
        (context.safePercentHeight * 10).heightBox,
        LabelText(
          type: 'Mt',
          value: 'You can change your browser password here',
          color: storeController.fontcolor.value,
        ),
        (context.safePercentHeight * 5).heightBox,
        verified == false
            ? TextInput(
                controller: t11,
                obsecure: false,
                label: 'ENTER YOUR OLD PASSWORD',
                animated: true,
              )
            : resetPassword(),
        (context.safePercentHeight * 5).heightBox,
        Button(label: 'Verified', action: cliked)
      ].vStack(alignment: MainAxisAlignment.center, axisSize: MainAxisSize.max),
    ).makeCentered();
  }
}
