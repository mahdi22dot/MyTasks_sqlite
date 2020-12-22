import 'package:flutter/cupertino.dart';
import 'package:sqllite_mytasks/Tasks_opperations/task_widget.dart';
import 'package:sqllite_mytasks/conistant/constant.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  changeCheckBoxPlaces() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children:
              tasks.map((e) => TaskWidget(e, changeCheckBoxPlaces)).toList()),
    );
  }
}
