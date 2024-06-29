import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/tarefa_provider.dart';
import 'screens/tarefa_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TarefaProvider(),
      child: MaterialApp(
        title: 'Tarefas App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TarefaListScreen(),
      ),
    );
  }
}
