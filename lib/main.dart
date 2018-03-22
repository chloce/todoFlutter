import 'package:flutter/material.dart';

import 'package:task/addTask.dart';

void main() => runApp(new MyApp());

final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  final title = 'Task Manager';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: title, routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => new MyHome(title: title),
      '/add': (BuildContext context) => new NewTask(),
    }, navigatorObservers: <NavigatorObserver>[
      routeObserver
    ]);
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  void didPopNext() {
    debugPrint("didPopNext ${runtimeType}");
  }

  List<String> tasks = <String>['aa', 'vv', 'bb', 'cc'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: _taskList(tasks, context),
        floatingActionButton: new FloatingActionButton(
            onPressed: _addTask, child: new Icon(Icons.add)));
  }

  _addTask() {
    Navigator.of(context).pushNamed('/add');
  }
}

Widget _taskList(List tasks, context) {
  return new ListView.builder(
    itemCount: tasks == null ? 0 : tasks.length,
    padding: const EdgeInsets.all(16.0),
    itemBuilder: (BuildContext context, int index) {
      return _taskListItem(tasks[index], context);
    },
  );
}

Widget _taskListItem(task, context) {
  return new Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: Theme.of(context).dividerColor))),
      child: new ListTile(
        title: new Text(task),
      ));
}
