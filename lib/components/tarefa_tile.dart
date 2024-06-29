import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TarefaTile extends StatelessWidget {
  final Tarefa tarefa;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  TarefaTile({
    required this.tarefa,
    required this.index,
    required this.onEdit,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tarefa.nome),
      subtitle: Text(tarefa.descricao),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: onTap,
    );
  }
}
