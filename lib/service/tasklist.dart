import 'package:flutter/material.dart';
import 'package:provider_listview/models/task.dart';

class Tasklist with ChangeNotifier {
  final List<Task> _taskList = [];

  get taskList => _taskList;

  void addNewTask(String taskName) {
    _taskList.add(
      Task(name: taskName, status: false),
    );
    notifyListeners();
    // This is why we use providers. This function notifies all the children widgets
    // of the Widget where we initiated our provider (see the parent of MaterialApp Widget in the above code)
    // This is why changes to data should be made within this class only as it extends ChangeNotifier,
    // which provides us with notifyListeners() method. Which ultimately notifies the widgets that the data has been modified and its time to rebuild the widgets that rely on this data!
  }
}
