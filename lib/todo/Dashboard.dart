import 'package:becalm_mobile/pages/menu/components/NavigationDrawer.dart';
import 'package:becalm_mobile/todo/TodoHome.dart';
import 'package:becalm_mobile/todo/prov/TodoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {

  static Widget getWidget() {
    return new Provider(
      create: (_) => TodosProvider(),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => TodosProvider(),
        builder: (context, child) => TodoHome(),
      ),
    );
  }
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(drawer: NavigationDrawerWidget(), body: TodoHome());
}
