import 'dart:convert';

import 'package:becalm_mobile/models/Todo.dart';
import 'package:becalm_mobile/todo/todo_services/TodoTaskService.dart';
import 'package:flutter/cupertino.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.done == false).toList();

  List<Todo> get todoCompleted =>
      _todos.where((element) => element.done == true).toList();

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

  void addTodo(Todo todo) {
    var todoTaskService = new TodoTaskService();

    var encode = json.encode(todo);
    todoTaskService.addTodoTask(encode);
  }

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.done == true).toList();

  bool toggleTodoStatus(Todo todo) {
    todo.done = !todo.done;
    var todoTaskService = new TodoTaskService();

    todoTaskService.toggleState(todo);

    return todo.done;
  }

  void removeTodo(Todo todo)  {
    var todoTaskService = new TodoTaskService();
    todoTaskService.removeTodo(todo);
  }



  void updateTodo(Todo todo, String title) {
    todo.text = title;
    var todoTaskService = new TodoTaskService();


    var encode = json.encode(todo);
    todoTaskService.updateTodo(encode);
  }
}
