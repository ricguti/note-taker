import 'package:flutter/material.dart';

class Note {
  String _title;
  String _body;

  Note(this._title, this._body);

  String get body => _body;

  String get title => _title;
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

  bool isEmpty() => _notes.isEmpty;

  int length() => _notes.length;

  Note getNote(int index) => _notes[index];
}