import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singular_flutter_sdk/singular.dart';

class Identity extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

}

class MainPageState extends State<Identity> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Custom User Id',
            ),
          ),
        ),
      ],
    );
  }

}