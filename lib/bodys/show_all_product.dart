import 'package:flutter/material.dart';

class ShowAllProduct extends StatefulWidget {
  const ShowAllProduct({ Key? key }) : super(key: key);

  @override
  _ShowAllProductState createState() => _ShowAllProductState();
}

class _ShowAllProductState extends State<ShowAllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Show All Product'),
    );
  }
}