import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<Skan> {
  final fineValueTextController = TextEditingController(text:'32');
  final coarseValueTextController = TextEditingController(text:'1');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: fineValueTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Fine Value',
              ),
            ),
          ),
        ],
      ),
    );
  }
}