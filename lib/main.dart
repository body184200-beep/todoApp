import 'package:flutter/material.dart';
import 'package:todo/providers/todo_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/homeScreen/Home.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => TodoProvider(),
          child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}

