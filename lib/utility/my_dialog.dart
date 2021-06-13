import 'package:flutter/material.dart';
import 'package:ungmarketer/utility/my_constant.dart';
import 'package:ungmarketer/widgets/show_image.dart';
import 'package:ungmarketer/widgets/show_title.dart';

class MyDialog {
  Future<Null> normalDialog(BuildContext context, String title) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.image2),
          title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
        ),actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }
}
