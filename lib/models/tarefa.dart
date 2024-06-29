class Tarefa {
  String nome;
  String descricao;
  bool andamento;
  String localizacao;

  Tarefa({
    required this.nome,
    required this.descricao,
    this.andamento = false,
    required this.localizacao,
  });
}
