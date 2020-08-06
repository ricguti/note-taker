import 'package:flutter/material.dart';
import 'package:note_taker/components/card_component.dart';
import 'package:note_taker/model/note_model.dart';
import 'package:note_taker/note_view.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.notes}) : super(key: key);

  final String title;
  final List<Note> notes;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(children: displayNotes(widget.notes)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteView(notes: widget.notes,)),
          );
        },
        tooltip: 'Create Note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> displayNotes(List<Note> notes) {
    List<CardComponent> notesToDisplay = List<CardComponent>();
    if (notes.isEmpty) {
      return [
        Container(
          padding: EdgeInsets.all(20.0),
            child: Text(
          'Your notes will be displayed here',
        ))
      ];
    }

    for (int i = 0; i < notes.length; i++) {
      notesToDisplay
          .add(CardComponent(title: notes[i].title, body: notes[i].body));
    }
    return notesToDisplay;
  }
}
