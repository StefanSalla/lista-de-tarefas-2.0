import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tarefa.dart';
import '../providers/tarefa_provider.dart';
import 'tarefa_form_screen.dart';

class TarefaDetailScreen extends StatelessWidget {
  final Tarefa tarefa;
  final int index;

  TarefaDetailScreen({required this.tarefa, required this.index});

  @override
  Widget build(BuildContext context) {
    final tarefaProvider = Provider.of<TarefaProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${tarefa.nome}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Descrição: ${tarefa.descricao}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Localização: ${tarefa.localizacao}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Andamento: ${tarefa.andamento ? "Concluído" : "Pendente"}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TarefaFormScreen(
                      tarefa: tarefa,
                      index: index,
                    ),
                  ),
                );
              },
              child: Text('Editar'),
            ),
            ElevatedButton(
              onPressed: () {
                tarefaProvider.atualizarAndamento(index, !tarefa.andamento);
              },
              child: Text(tarefa.andamento ? 'Marcar como Pendente' : 'Marcar como Concluído'),
            ),
          ],
        ),
      ),
    );
  }
}
