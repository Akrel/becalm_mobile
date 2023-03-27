import 'package:intl/intl.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  String text;
  String uid;
  bool done;

  Todo({
    required this.text,
    required this.uid,
    this.done = false,
  });

  static Todo fromJson(Map<String, dynamic> json) =>
      Todo(text: json['text'], uid: json['uid'], done: json['done']);

  Map<String, dynamic> toJson() => {'uid': uid, 'done': done, 'text': text};


}