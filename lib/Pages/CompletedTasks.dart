import 'package:flutter/cupertino.dart';
import 'package:sqllite_mytasks/Tasks_opperations/task_widget.dart';
import 'package:sqllite_mytasks/conistant/constant.dart';

class CompleteTasks extends StatefulWidget {
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  changeCheckBoxPlaces() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: tasks
              .where((element) => element.isComplete == true)
              .map((e) => TaskWidget(e, changeCheckBoxPlaces))
              .toList()),
    );
  }
}
