import 'package:sqllite_mytasks/database_helper/dbHelper.dart';

class Task {
  String taskName;
  bool isComplete;
  Task(this.taskName, this.isComplete);

  toJson() {
    return {
      DBHelper.tasknamecol: this.taskName,
      DBHelper.taskiscompletecol: this.isComplete ? 1 : 0
    };
  }

  Task.fromJson(Map map){
    this.taskName = map[DBHelper.tasknamecol];
    this.isComplete = map[DBHelper.taskiscompletecol] == 1? true:false;
  }
  
}
