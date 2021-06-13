import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ungmarketer/models/user_model.dart';
import 'package:ungmarketer/utility/my_constant.dart';
import 'package:ungmarketer/utility/my_dialog.dart';
import 'package:ungmarketer/widgets/show_image.dart';
import 'package:ungmarketer/widgets/show_title.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              buildImage(size),
              buildTitle(),
              buildUser(size),
              buildPassword(size),
              buildLogin(size),
              buildCreateAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: MyConstant().h3Style(),
        ),
        TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, MyConstant.routeCreateAccount),
            child: Text('Create New Account'))
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: MyConstant.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                String path =
                    'https://www.androidthai.in.th/bigc/getUserWhereUser.php?isAdd=true&user=${userController.text}';

                await Dio().get(path).then((value) async {
                  if (value.toString() == 'null') {
                    MyDialog().normalDialog(context, 'No User นี่ใน ฐานข้อมูล');
                  } else {
                    var result = json.decode(value.data);
                    for (var item in result) {
                      print('### item ==> $item');
                      UserModel model = UserModel.fromMap(item);
                      if (passwordController.text == model.password) {
                        List<String> strings = [];
                        strings.add(model.id);
                        strings.add(model.name);
                        strings.add(model.user);
                        strings.add(model.password);
                        strings.add(model.lat);
                        strings.add(model.lat);

                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setStringList('data', strings).then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                                context,
                                MyConstant.routeMyService,
                                (route) => false));
                      } else {
                        MyDialog().normalDialog(
                            context, 'Password False ? Please Try Again');
                      }
                    }
                  }
                });
              }
            },
            child: Text('Login'),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.5,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก User ด้วยคะ';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.perm_identity,
                color: MyConstant.dart,
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'User :',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.5,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password ด้วยคะ';
              } else {
                return null;
              }
            },
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: MyConstant.dart,
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'Password :',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyConstant.appName,
          textStyle: MyConstant().h1Style(),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.6,
          child: ShowImage(path: MyConstant.image3),
        ),
      ],
    );
  }
}
