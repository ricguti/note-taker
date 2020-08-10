import 'package:flutter/material.dart';
import 'package:note_taker/models/note_model.dart';
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  NoteView({Key key, this.index}) : super(key: key);

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
    NotesModel notes = Provider.of<NotesModel>(context);
    if (widget.index >= 0 && widget.index < notes.length()) {
      Note note = notes.getNote(widget.index);
      titleController.text = note.title;
      bodyController.text = note.body;
    }
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[_saveAction(notes), _deleteAction(notes)],
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

  IconButton _saveAction(NotesModel notes) {
    return IconButton(
      icon: const Icon(Icons.save),
      tooltip: 'Save Note',
      onPressed: () {
        Note note = Note(titleController.text, bodyController.text);
        widget.index == -1
            ? notes.addNote(note)
            : notes.editNote(widget.index, note);
        Navigator.pop(context);
      },
    );
  }

  IconButton _deleteAction(NotesModel notes) {
    return IconButton(
      icon: const Icon(Icons.delete),
      tooltip: 'Delete Note',
      onPressed: () {
        notes.removeNote(widget.index);
        Navigator.pop(context);
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
