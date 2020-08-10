import 'package:flutter/material.dart';

class Note {
  String title;
  String body;

  Note(this.title, this.body);
}

class NotesModel extends ChangeNotifier {
  final List<Note> _notes = [];

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  void removeNote(int index) {
    if(index >= 0 && index < _notes.length) {
      _notes.removeAt(index);
      notifyListeners();
    }
  }

  void editNote(int index, Note note) {
    if(index >= 0 && index < _notes.length) {
      _notes[index] = note;
      notifyListeners();
    }
  }
}

final List<Note> notes = [];