import 'package:flutter/material.dart';
import 'package:note_taker/models/note_model.dart';

import 'home_view.dart';

class NoteView extends StatefulWidget {
  NoteView({Key key, this.notes, this.index}) : super(key: key);

  final List<Note> notes;
  final int index;

  @override
  State<StatefulWidget> createState() => _NoteViewState();
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
    if (widget.index >= 0) {
      titleController.text = widget.notes[widget.index].title;
      bodyController.text = widget.notes[widget.index].body;
    }
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[_saveAction(), _deleteAction()],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _textFieldContainer(
              _titleTextField('Note Title', titleController),
            ),
            Expanded(
                child: _textFieldContainer(
                    _bodyTextField('Note Body', bodyController))),
          ],
        ),
      ),
    );
  }

  IconButton _saveAction() {
    return IconButton(
      icon: const Icon(Icons.save),
      tooltip: 'Save Note',
      onPressed: () {
        widget.index >= 0
            ? widget.notes[widget.index] =
                new Note(titleController.text, bodyController.text)
            : widget.notes
                .add(new Note(titleController.text, bodyController.text));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeView(title: 'Note Taker', notes: notes)),
        );
      },
    );
  }

  IconButton _deleteAction() {
    return IconButton(
      icon: const Icon(Icons.delete),
      tooltip: 'Delete Note',
      onPressed: () {
        if (widget.index >= 0) {
          widget.notes.removeAt(widget.index);
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeView(title: 'Note Taker', notes: notes)),
        );
      },
    );
  }

  Container _textFieldContainer(TextField textField) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0), child: textField);
  }

  TextField _titleTextField(
      String labelText, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: controller,
    );
  }

  TextField _bodyTextField(String labelText, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none,
      ),
      controller: controller,
    );
  }
}
