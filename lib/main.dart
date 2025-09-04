import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app')),
        body: Text('Hello world'),
        floatingActionButton: FloatingActionButton
        (onPressed: null, child: Text('Click'),),
      ),
    ),
  );
}