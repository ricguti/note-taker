import 'package:flutter/material.dart';
import 'package:note_taker/components/card_component.dart';
import 'package:note_taker/models/note_model.dart';

import 'note_view.dart';

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
        child: ListView(
          children: displayNotes(widget.notes),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteView(notes: widget.notes, index: -1,)),
          );
        },
        tooltip: 'Create Note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> displayNotes(List<Note> notes) {
    List<Widget> notesToDisplay = List<Widget>();
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
      notesToDisplay.add(
          GestureDetector(
            child: CardComponent(title: notes[i].title, body: notes[i].body),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteView(notes: widget.notes, index: i,)),
              );
            },
          )
      );
    }
    return notesToDisplay;
  }
}
