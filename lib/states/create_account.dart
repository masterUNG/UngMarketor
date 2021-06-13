import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ungmarketer/utility/my_constant.dart';
import 'package:ungmarketer/utility/my_dialog.dart';
import 'package:ungmarketer/widgets/show_progress.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? lat, lng;
  Map<MarkerId, Marker> markers = {};
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.5,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill Name in Blank';
              } else {}
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.fingerprint,
                color: MyConstant.dart,
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'Name :',
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
                return 'Please Fill User in Blank';
              } else {}
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
                return 'Please Fill Password in Blank';
              } else {}
            },
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;

      MarkerId markerId = MarkerId('id');
      markers[markerId] = Marker(
        markerId: markerId,
        position: LatLng(lat!, lng!),
        infoWindow: InfoWindow(
            title: 'You Here !!!', snippet: 'Lat = $lat, Lng = $lng'),
      );
    });
  }

  Future<Position?> findPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => processCreateAccount(),
            icon: Icon(Icons.cloud_upload_outlined),
          ),
        ],
        backgroundColor: MyConstant.primary,
        title: Text('Create New Account'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            buildName(size),
            buildUser(size),
            buildPassword(size),
            buildMap(size),
          ],
        ),
      ),
    );
  }

  Future<Null> processCreateAccount() async {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      String user = userController.text;
      String password = passwordController.text;
      print('## name = $name, user = $user, password = $password');

      // check user
      String apiCheckUser =
          'https://www.androidthai.in.th/bigc/getUserWhereUser.php?isAdd=true&user=$user';
      await Dio().get(apiCheckUser).then((value) async {
        print('value = $value');
        if (value.toString() == 'null') {
          print('User True');
          String path =
              'https://www.androidthai.in.th/bigc/insertUser.php?isAdd=true&name=$name&user=$user&password=$password&lat=$lat&lng=$lng';
          await Dio().get(path).then((value) {
            if (value.toString() == 'true') {
              Navigator.pop(context);
            } else {
              MyDialog().normalDialog(context, 'Please Try Again');
            }
          });
        } else {
          print('User False');
          MyDialog()
              .normalDialog(context, 'User ซ้ำ กรุณาเปลี่ยน User ใหม่คะ ');
        }
      });
    }
  }

  Row buildMap(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          width: size - 60,
          height: size,
          child: lat == null
              ? ShowProgress()
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(lat!, lng!),
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {},
                  markers: Set<Marker>.of(markers.values),
                ),
        ),
      ],
    );
  }
}
