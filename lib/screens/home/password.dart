import 'package:browser/components/Button.dart';
import 'package:browser/components/TextField.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../components/LabelText.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool verified = false;
  Widget resetPassword() {
    return VxBox(
            child: [
      TextInput(
        obsecure: false,
        label: 'ENTER YOUR NEW PASSWORD',
        animated: true,
      ),
      TextInput(
        obsecure: false,
        label: 'RE ENTER YOUR PASSWORD',
        animated: true,
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
            type: 'Mt', value: 'You can change your browser password here'),
        (context.safePercentHeight * 5).heightBox,
        verified == false
            ? TextInput(
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
