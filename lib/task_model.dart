import 'dart:convert';

import 'package:mahara_db/db_helper.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  String? title;
  bool? isComplete;
  int? id;
  Task({
    this.title,
    this.isComplete,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DbHelper.taskNameColumn: title,
       DbHelper.taskIsCompleteColumn: (isComplete??false)?1:0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map[DbHelper.taskNameColumn] as String ,
      isComplete:  map[DbHelper.taskIsCompleteColumn]==1?true:false ,
      id:  map[DbHelper.taskIdColumn],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);
}
