// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
