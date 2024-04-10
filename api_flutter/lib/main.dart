import 'package:api_flutter/edit_todo.dart';
import 'package:api_flutter/pages/add_todo.dart';
import 'package:api_flutter/pages/todo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      initialRoute: '/mainpage',
      routes: {
        '/mainpage': (context) => const TodoPage(),
        '/homepage': (context) => const AddTodo(),
        '/editpage': (context) => const EditTodo()
      },
    );
  }
}
