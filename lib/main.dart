import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext centext) {
    var _routes = <String, WidgetBuilder>{
      '/newTask': (BuildContext context) => new NewTask()
    };
    return new MaterialApp(
        title: 'task management', home: new MyHomePage(), routes: _routes);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('task management')),
        body: new TaskContent());
  }
}

class TaskContent extends StatefulWidget {
  @override
  TaskContentState createState() => new TaskContentState();
}

class TaskContentState extends State<TaskContent> {
  List tasks = <String>['aa', 'bb', 'cc', 'lunch', 'dinner'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
            itemCount: tasks == null ? 0 : tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return new Text(tasks[index]);
            }),
        floatingActionButton: new FloatingActionButton(
          onPressed: _onPressed,
          child: new Icon(Icons.add),
        ));
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/newTask");
  }
}

class NewTask extends StatefulWidget {
  @override
  NewTaskState createState() => new NewTaskState();
}

class NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('add new Task',
        ),
        body: new Center(
            child: new Column(
          children: <Widget>[new Text('add your todo'), new TextField()],
        )));
  }
}
