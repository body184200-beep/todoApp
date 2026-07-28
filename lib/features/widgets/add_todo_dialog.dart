import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_providers.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo'),

      content: TextField(controller: todoController),

      actions: [
        IconButton(
          icon: Icon(Icons.add, color: Colors.green),

          onPressed: () {
            if (todoController.text.trim().isEmpty) {
              return;
            }

            context.read<TodoProvider>().addTodo(todoController.text.trim());

            todoController.clear();

            Navigator.pop(context);
          },
        ),

        IconButton(
          icon: Icon(Icons.close, color: Colors.red),

          onPressed: () {
            todoController.clear();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
