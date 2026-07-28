import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/todo_model.dart';
import '../../providers/todo_providers.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final int index;

  const TodoTile({super.key, required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          context.read<TodoProvider>().toggleTodo(index);
        },
      ),

      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),

      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          context.read<TodoProvider>().removeTodo(index);
        },
      ),
    );
  }
}
