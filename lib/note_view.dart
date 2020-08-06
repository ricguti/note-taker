import 'package:flutter/material.dart';
import 'package:note_taker/main.dart';
import 'package:note_taker/model/note_model.dart';

class NoteView extends StatefulWidget {
  NoteView({Key key, this.notes}) : super(key: key);

  final List<Note> notes;

  @override
  State<StatefulWidget> createState() => _NoteViewState();
  void setTitle(String text) {}
}

class _NoteViewState extends State<NoteView> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Note',
            onPressed: () {
              // save the note
              widget.notes.add(new Note(titleController.text, bodyController.text));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Note Taker', notes: notes)),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Note Title',
                ),
                controller: titleController,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Note Body',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                controller: bodyController,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
