import 'package:flutter/material.dart';
import 'package:ungmarketer/utility/my_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWeb extends StatefulWidget {
  const ShowWeb({ Key? key }) : super(key: key);

  @override
  _ShowWebState createState() => _ShowWebState();
}

class _ShowWebState extends State<ShowWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(initialUrl: MyConstant.urlWeb,),
    );
  }
}