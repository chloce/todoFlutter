import 'package:flutter/material.dart';
import 'dart:async';

Future<String> addTaskPage(context) async {
  final TextEditingController _controller = new TextEditingController();
  return Navigator
      .of(context)
      .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(
          'add new Task',
        )),
        body: new Column(
          children: <Widget>[
            new Text('add your todo'),
            new TextField(
              controller: _controller,
              decoration: new InputDecoration(hintText: 'Type your task'),
            ),
            new RaisedButton(
              child: new Text('add'),
              onPressed: () {
                return Navigator.pop(context, _controller.text.trim() ?? '');
              },
            )
          ],
        ));
  }));
}
