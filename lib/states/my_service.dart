import 'package:flutter/material.dart';
import 'package:ungmarketer/bodys/show_all_product.dart';
import 'package:ungmarketer/bodys/show_cart.dart';
import 'package:ungmarketer/bodys/show_order.dart';
import 'package:ungmarketer/bodys/show_web.dart';
import 'package:ungmarketer/utility/my_constant.dart';

import 'package:ungmarketer/widgets/show_title.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<Widget> widgets = [
    ShowAllProduct(),
    ShowCart(),
    ShowOrder(),
    ShowWeb(),
  ];

  int indexWidget = 0;

  List<String> titles = [
    'Show All Product',
    'Show Cart',
    'Show Order',
    'Show Web',
  ];

  List<IconData> iconDatas = [
    Icons.filter_1,
    Icons.filter_2,
    Icons.filter_3,
    Icons.filter_4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: null, accountEmail: null),
            buildMenuShowProduct(),
            buildMenuShowCart(),
            buildMenuShowOrder(),
            buildMenuShowWeb(),
          ],
        ),
      ),
      body: widgets[indexWidget],
    );
  }

  ListTile buildMenuShowProduct() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          indexWidget = 0;
        });
      },
      leading: Icon(iconDatas[0], size: 36, color: MyConstant.dart),
      title: ShowTitle(title: titles[0], textStyle: MyConstant().h2Style()),
    );
  }

  ListTile buildMenuShowCart() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          indexWidget = 1;
        });
      },
      leading: Icon(iconDatas[1], size: 36, color: MyConstant.dart),
      title: ShowTitle(title: titles[1], textStyle: MyConstant().h2Style()),
    );
  }

  ListTile buildMenuShowOrder() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          indexWidget = 2;
        });
      },
      leading: Icon(iconDatas[2], size: 36, color: MyConstant.dart),
      title: ShowTitle(title: titles[2], textStyle: MyConstant().h2Style()),
    );
  }

  ListTile buildMenuShowWeb() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          indexWidget = 3;
        });
      },
      leading: Icon(iconDatas[3], size: 36, color: MyConstant.dart),
      title: ShowTitle(title: titles[3], textStyle: MyConstant().h2Style()),
    );
  }
}
