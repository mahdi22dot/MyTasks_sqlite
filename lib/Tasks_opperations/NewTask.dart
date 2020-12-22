import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite_mytasks/Tasks_opperations/task_model.dart';
import 'package:sqllite_mytasks/database_helper/dbHelper.dart';
import 'package:sqllite_mytasks/splach.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String taskName;
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  this.taskName = value;
                  setState(() {});
                }),
            Checkbox(
                value: isComplete,
                onChanged: (value) {
                  this.isComplete = value;
                  setState(() {});
                }),
            RaisedButton(
                child: Text('Add New Task'),
                onPressed: () {
                  DBHelper.dbHelper
                      .insertNewTask(Task(this.taskName, this.isComplete));
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SplachPage();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
