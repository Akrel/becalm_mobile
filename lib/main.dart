import 'package:becalm_mobile/todo/prov/TodoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'user/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context) => TodosProvider(),)
      ],
      child: MaterialApp(
        title: 'App title',
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
