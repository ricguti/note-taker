import 'package:flutter/material.dart';
import 'package:note_taker/components/card_component.dart';
import 'package:note_taker/models/note_model.dart';

import 'note_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title, this.notes}) : super(key: key);

  final String title;
  final List<Note> notes;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: widget.notes.isEmpty
            ? Text('Your notes will be displayed here')
            : ListView.builder(
                itemCount: widget.notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return _tapableCard(widget.notes[index].title,
                      widget.notes[index].body, _navigateToNoteView(index));
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToNoteView(-1),
        tooltip: 'Create Note',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  GestureDetector _tapableCard(
      String cardTitle, String cardBody, GestureTapCallback _tap) {
    return GestureDetector(
      child: CardComponent(title: cardTitle, body: cardBody),
      onTap: _tap,
    );
  }

  GestureTapCallback _navigateToNoteView(int index) {
    return () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NoteView(
                    notes: widget.notes,
                    index: index,
                  )),
        );
  }
}
