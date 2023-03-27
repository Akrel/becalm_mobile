import 'dart:convert';

import 'package:becalm_mobile/models/Todo.dart';
import 'package:becalm_mobile/utils/HttpService.dart';

class TodoTaskService {
  late final HttpService httpService;

  TodoTaskService() {
    httpService = HttpService();
  }

  Stream<List<Todo>> getTodos() {
    var future = httpService.get(Uri.parse("todoTask/getAll"));
    return future
        .then((value) => (jsonDecode(utf8.decode(value.bodyBytes)) as List)
            .map((e) => Todo.fromJson(e))
            .toList())
        .asStream();
  }

  Future toggleState(Todo todo) async {
    return httpService.put(Uri.parse("todoTask/toogleTask/${todo.uid}"));
  }

  Future addTodoTask(String task) async {
    return httpService.put(Uri.parse("todoTask/addNew"), body: task);
  }

  Future removeTodo(Todo todo) async {
    return httpService.delete(Uri.parse("todoTask/remove/${todo.uid}"));
  }

  Future updateTodo(String todo) async {
    return httpService.put(Uri.parse("todoTask/editTodo"), body: todo);
  }
}
