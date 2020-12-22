import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqllite_mytasks/database_helper/dbHelper.dart';
import 'package:sqllite_mytasks/tabbar/tabbar.dart';
import 'conistant/constant.dart';

class SplachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.getAllTasks().then((value) => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            tasks = List.from(value);
            return TapBar();
          }))
        });
    return Scaffold(
      body: Center(
        child: Text("Wellcome..."),
      ),
    );
  }
}
