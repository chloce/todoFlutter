import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  NewTaskState createState() => new NewTaskState();
}

class NewTaskState extends State<NewTask> {
  String newTask;
  final TextEditingController _controller =
      new TextEditingController(); //textfieldの中身
  @override
  Widget build(BuildContext context) {
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
              onPressed: _onPressed,
            )
          ],
        ));
  }

  void _onPressed() {
    Navigator.pop(context, _controller.text.trim() ?? '');
  }
}
