class NoteHub{


  List<Note> note = [];

  NoteHub({required this.note});

  NoteHub.fromJson(json) {
  if (json['note'] != null) {
  note = <Note>[];
  json['note'].forEach((v) {
  note.add(new Note.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.note != null) {
  data['note'] = this.note.map((v) => v.toJson()).toList();
  }
  return data;
  }
}


class Note {

  String? id;
  String? title;
  String? message;
  String? date;


  Note({this.id, this.title, this.message, this.date});

  Note.fromJson(Map<String, dynamic>jsonData){
    title = jsonData["title"];
    id = jsonData['_id'];
    message = jsonData["message"];
    date = jsonData['date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['date'] = this.date;

    return data;
  }
}
