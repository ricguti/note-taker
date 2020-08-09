import 'package:flutter/material.dart';
import 'package:note_taker/models/note_model.dart';
import 'package:note_taker/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taker',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // This makes the visual density adapt to the platform that you run
        // the app on.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Note Taker', notes: notes),
    );
  }
}
