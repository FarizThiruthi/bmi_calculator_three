import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/todoProvider.dart';
import '../model/modelClassTodoList.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDoProvider>(context);

    void _showAddItemDialog() {
      String newItem = '';
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Item'),
            content: TextField(
              onChanged: (value) {
                newItem = value;
              },
              decoration: InputDecoration(labelText: 'Item'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (newItem.isNotEmpty) {
                    todoProvider.addItem(TodoItem(title: newItem));
                  }
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoProvider.todoItems.length,
        itemBuilder: (context, index) {
          TodoItem todoItem = todoProvider.todoItems[index];
          return Card(
            child: CheckboxListTile(
              onChanged: (value) {
                todoProvider.toggleItemStatus(index);
              },
              value: todoItem.isDone,
              title: Text(todoItem.title),
            ),
          );
        },
      ),
    );
  }
}
