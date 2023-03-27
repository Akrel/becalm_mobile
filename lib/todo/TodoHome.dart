import 'package:becalm_mobile/models/Todo.dart';
import 'package:becalm_mobile/pages/menu/components/NavigationDrawer.dart';
import 'package:becalm_mobile/todo/CompletedListWidget.dart';
import 'package:becalm_mobile/todo/prov/TodoProvider.dart';
import 'package:becalm_mobile/todo/todo_services/TodoTaskService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddTodoDialog.dart';
import 'TodoList.dart';

class TodoHome extends StatefulWidget {
  late final TodoTaskService taskService;

  @override
  State<StatefulWidget> createState() => _ToDoPage(taskService);

  TodoHome() {
    taskService = new TodoTaskService();
  }
}

class _ToDoPage extends State<TodoHome> {
  int selectedIndex = 0;
  late TodoTaskService taskService;

  _ToDoPage(TodoTaskService taskService) {
    this.taskService = taskService;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoList(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Todo"),
      ),
      drawer: NavigationDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Zadania',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Ukończone',
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: taskService.getTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos!);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Colors.green,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
