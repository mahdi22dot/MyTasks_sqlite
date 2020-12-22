import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite_mytasks/Tasks_opperations/task_model.dart';
import 'package:sqllite_mytasks/conistant/constant.dart';
import 'package:sqllite_mytasks/database_helper/dbHelper.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  Task task;
  Function fun;
  TaskWidget(this.task, [this.fun]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showAlertDialog(context);
                  }),
              Text(widget.task.taskName),
              Checkbox(
                  value: widget.task.isComplete,
                  onChanged: (value) {
                    this.widget.task.isComplete = !this.widget.task.isComplete;
                    DBHelper.dbHelper.updateTask(widget.task);
                    setState(() {});
                    widget.fun();
                  })
            ],
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        tasks
            .removeWhere((element) => widget.task.taskName == element.taskName);
        DBHelper.dbHelper.deleteTask(widget.task.taskName);
        setState(() {});
        widget.fun();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Would you like to continue this step?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
