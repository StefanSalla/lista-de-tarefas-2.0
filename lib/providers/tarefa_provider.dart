import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TarefaProvider with ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  void addTarefa(Tarefa tarefa) {
    _tarefas.add(tarefa);
    notifyListeners();
  }

  void editarTarefa(int index, Tarefa tarefa) {
    if (index >= 0 && index < _tarefas.length) {
      _tarefas[index] = tarefa;
      notifyListeners();
    }
  }

  void excluirTarefa(int index) {
    if (index >= 0 && index < _tarefas.length) {
      _tarefas.removeAt(index);
      notifyListeners();
    }
  }

  void atualizarAndamento(int index, bool andamento) {
    if (index >= 0 && index < _tarefas.length) {
      _tarefas[index].andamento = andamento;
      notifyListeners();
    }
  }
}
