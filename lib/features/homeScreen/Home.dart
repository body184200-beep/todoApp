import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_providers.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_titel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();

    final todos = todoProvider.todos;
    final todoCount = todoProvider.todoCount;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),

        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '$todoCount',
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),


      body: todos.isEmpty
          ? const Center(
        child: Text(
          'No Todos Yet 📝',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      )
          : ListView.builder(
        itemCount: todos.length,

        itemBuilder: (context, index) {
          return TodoTile(
            todo: todos[index],
            index: index,
          );
        },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {

          showDialog(
            context: context,
            builder: (_) => const AddTodoDialog(),
          );

        },

        child: const Icon(Icons.add),
      ),
    );
  }
}