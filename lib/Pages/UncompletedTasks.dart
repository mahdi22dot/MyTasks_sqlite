import 'package:flutter/cupertino.dart';
import 'package:sqllite_mytasks/Tasks_opperations/task_widget.dart';
import 'package:sqllite_mytasks/conistant/constant.dart';

class InCompleteTasks extends StatefulWidget {
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  changeCheckBoxPlaces() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: tasks
              .where((element) => element.isComplete == false)
              .map((e) => TaskWidget(e, changeCheckBoxPlaces))
              .toList()),
    );
  }
}
