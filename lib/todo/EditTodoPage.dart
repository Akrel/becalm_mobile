import 'package:becalm_mobile/models/Todo.dart';
import 'package:becalm_mobile/todo/TodoFormWidget.dart';
import 'package:becalm_mobile/todo/prov/TodoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({ Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.todo.text;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edytuj zadanie'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            final provider =
            Provider.of<TodosProvider>(context, listen: false);
            provider.removeTodo(widget.todo);

            Navigator.of(context).pop();
          },
        )
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          onChangedTitle: (title) => setState(() => this.title = title),
          onSavedTodo: saveTodo,
        ),
      ),
    ),
  );

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title);

      Navigator.of(context).pop();
    }
  }
}
