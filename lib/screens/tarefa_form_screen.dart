import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../models/tarefa.dart';
import '../providers/tarefa_provider.dart';

class TarefaFormScreen extends StatefulWidget {
  final Tarefa? tarefa;
  final int? index;

  TarefaFormScreen({this.tarefa, this.index});

  @override
  _TarefaFormScreenState createState() => _TarefaFormScreenState();
}

class _TarefaFormScreenState extends State<TarefaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _descricao;
  String _localizacao = '';

  @override
  void initState() {
    super.initState();
    _nome = widget.tarefa?.nome ?? '';
    _descricao = widget.tarefa?.descricao ?? '';
    _localizacao = widget.tarefa?.localizacao ?? '';
    if (_localizacao.isEmpty) {
      _obterLocalizacao();
    }
  }

  Future<void> _obterLocalizacao() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    setState(() {
      _localizacao = '${locationData.latitude}, ${locationData.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tarefa == null ? 'Adicionar Tarefa' : 'Editar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nome = value!;
                },
              ),
              TextFormField(
                initialValue: _descricao,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição';
                  }
                  return null;
                },
                onSaved: (value) {
                  _descricao = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final novaTarefa = Tarefa(
                      nome: _nome,
                      descricao: _descricao,
                      andamento: widget.tarefa?.andamento ?? false,
                      localizacao: _localizacao,
                    );
                    final tarefaProvider = Provider.of<TarefaProvider>(context, listen: false);
                    if (widget.tarefa == null) {
                      tarefaProvider.addTarefa(novaTarefa);
                    } else {
                      tarefaProvider.editarTarefa(widget.index!, novaTarefa);
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
