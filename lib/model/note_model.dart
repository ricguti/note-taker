class Note {
  String title;
  String body;

  Note(this.title, this.body);

  void setTitle(String title) => this.title = title;

  void setContent(String content) => this.body = content;
}

final List<Note> notes = [];