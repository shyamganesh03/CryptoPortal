import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_windows/webview_windows.dart';
import '../../components/Button.dart';
import '../../data/datastores.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, this.start = '0'})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // late TabbedViewController _controller;
  final webcontroller = WebviewController();
  final storeController = Get.put(DataStore());
  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String serachurl = 'https://www.google.com/search?q=${widget.searchQuery}';
    try {
      await webcontroller.initialize();
      webcontroller.url.listen((url) {
        _textController.text = url;
      });

      await webcontroller.setBackgroundColor(Colors.transparent);
      await webcontroller
          .loadUrl('https://www.google.com/search?q=${widget.searchQuery}');
      await webcontroller.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);
      storeController.firebasedata.length != 0 &&
          storeController.firebasedata[0].emailid != null &&
          storeController.updatehistory(serachurl);
      // storeController.firebasedata[0].emailid != null &&
      //     storeController.updatehistory(serachurl);
      if (!mounted) return;
      setState(() {});
    } on PlatformException catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Error'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Code: ${e.code}'),
                      Text('Message: ${e.message}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Continue'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
      });
    }
  }

  Widget webwidget() {
    return Stack(
      children: [
        Webview(
          webcontroller,
        ),
        StreamBuilder<LoadingState>(
            stream: webcontroller.loadingState,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data == LoadingState.loading) {
                return LinearProgressIndicator();
              } else {
                return SizedBox();
              }
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ZStack([
        Container(
          child: webwidget(),
        ),
        VxBox(
          child: IButton(
            id: 13,
            icon: FontAwesomeIcons.houseChimney,
            action: () => storeController.changePage(1),
          ),
        ).blue700.roundedFull.make().positioned(
            bottom: context.safePercentHeight * 15,
            left: context.safePercentWidth * 1)
      ]),
    );
  }
}
