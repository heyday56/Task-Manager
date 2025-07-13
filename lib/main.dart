import 'package:best_app/Pages/Add_list.dart';
import 'package:best_app/Pages/Note_List.dart';
import 'package:best_app/Pages/stack.dart';
import 'package:flutter/material.dart';

void main() {
  final myTaskStack = MyStack<Map<String, String>>(); // ✅ create the stack
  runApp(MyApp(stack: myTaskStack));
}

class MyApp extends StatelessWidget {
  final MyStack<Map<String, String>> stack;

  const MyApp({super.key, required this.stack});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NoteList(stack: stack), // ✅ pass it here
    );
  }
}

