import 'package:fill_in_blanks/chateGpt/chate_fill.dart';
import 'package:fill_in_blanks/chateGpt/chatgpt.dart';
import 'package:fill_in_blanks/color/colorGame.dart';
import 'package:fill_in_blanks/drag_drop/drag_drop.dart';
// import 'package:fill_in_blanks/drag_drop/drag_drop.dart';
import 'package:fill_in_blanks/fill_in_blanks.dart';

import 'package:flutter/material.dart';

import 'chateGpt/drag_drop3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //home: FillTheBlanks1(),
      //home: FillInTheBlanks2(),
      //home: const DragandDrop(),
      home: const FillTheBlanks(),
      //home: QuizPage(),
      //home: const Colorgame(),
      //home: const FillTheBlanks(),
    );
  }
}
