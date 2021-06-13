import 'package:flutter/material.dart';

class ShowCart extends StatefulWidget {
  const ShowCart({ Key? key }) : super(key: key);

  @override
  _ShowCartState createState() => _ShowCartState();
}

class _ShowCartState extends State<ShowCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Show Cart'),
    );
  }
}