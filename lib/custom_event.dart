import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singular_flutter_sdk/singular.dart';
import 'dart:convert';

class CustomEvent extends StatefulWidget {
  const CustomEvent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

}

class MainPageState extends State<CustomEvent> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              hintText: 'Event Name',
            ),
          ),
        )
      ],
    );
  }

}