import 'package:flutter/material.dart';
import 'package:note_taker/components/card_component.dart';
import 'package:note_taker/models/note_model.dart';
import 'package:provider/provider.dart';

import 'note_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

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
          child: Consumer<NotesModel>(
            builder: (context, notes, child) {
              return notes.isEmpty() || notes.length() == 0
                  ? Text('Your notes will be displayed here')
                  : ListView.builder(
                  itemCount: notes.length(),
                  itemBuilder: (BuildContext context, int index) {
                    return _tapableCard(
                        notes.getNote(index).title,
                        notes.getNote(index).body,
                        _navigateToNoteView(index));
                  });
            },
          ),
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
                    index: index,
                  )),
        );
  }
}
