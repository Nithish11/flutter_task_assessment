import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserViewModel()..loadUsers(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListView(),
    );
  }
}
