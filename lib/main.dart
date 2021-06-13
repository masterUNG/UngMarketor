import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungmarketer/states/authen.dart';
import 'package:ungmarketer/states/create_account.dart';
import 'package:ungmarketer/states/my_service.dart';
import 'package:ungmarketer/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myService': (BuildContext context) => MyService(),
};

String? initialRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String>? strings = preferences.getStringList('data');
  print('strings ==>> $strings');
  if (strings == null) {
    initialRoute = MyConstant.routeAuthen;
    runApp(MyApp());
  } else {
    initialRoute = MyConstant.routeMyService;
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initialRoute,
    );
  }
}
