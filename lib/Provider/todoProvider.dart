import 'package:flutter/foundation.dart';
import '../model/modelClassTodoList.dart';

class ToDoProvider with ChangeNotifier {
  List<TodoItem> todoItems = [];

  void addItem(TodoItem item) {
    todoItems.add(item);
    notifyListeners();
  }

  void toggleItemStatus(int index) {
    if (index >= 0 && index < todoItems.length) {
      todoItems[index].isDone = !todoItems[index].isDone;
      notifyListeners();
    }
  }
}
