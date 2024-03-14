import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Revenue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<Revenue> {
  final revenueTextController = TextEditingController();
  final currencyTextController = TextEditingController();
  final revenueEventNameTextController = TextEditingController();

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
              controller: revenueEventNameTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Revenue Event Name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}