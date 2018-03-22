import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key, this.tasks}) : super(key: key);
  final tasks;
  AddTaskState createState() => new AddTaskState();
}

class AddTaskState extends State<AddTask> {
  String newTask;
  final TextEditingController _controller = new TextEditingController();
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
    //setState(widget.tasks.add('a'));
    Navigator.pop(context, _controller.text.trim() ?? '');
  }
}
