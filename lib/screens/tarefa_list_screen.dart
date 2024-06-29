import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/components/tarefa_tile.dart';
import 'package:lista_de_tarefas/screens/details_screen.dart';
import 'package:provider/provider.dart';
import '../providers/tarefa_provider.dart';
import 'tarefa_form_screen.dart';

class TarefaListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tarefaProvider = Provider.of<TarefaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: tarefaProvider.tarefas.length,
        itemBuilder: (context, index) {
          return TarefaTile(
            tarefa: tarefaProvider.tarefas[index],
            index: index,
            onEdit: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TarefaFormScreen(
                    tarefa: tarefaProvider.tarefas[index],
                    index: index,
                  ),
                ),
              );
            },
            onDelete: () {
              tarefaProvider.excluirTarefa(index);
            },
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TarefaDetailScreen(
                    tarefa: tarefaProvider.tarefas[index],
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TarefaFormScreen(),
            ),
          );
        },
      ),
    );
  }
}
