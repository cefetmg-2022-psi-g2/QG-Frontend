class Pedido {
  int id;
  String item;
  int campus;
  int predio;
  String complemento;
  int categoria;
  String? observacoes;
  String reqName;
  double score;

  Pedido(
      {required this.id,
      required this.item,
      required this.campus,
      required this.predio,
      required this.complemento,
      required this.categoria,
      this.observacoes = null,
      this.reqName = "",
      this.score = 0});
}
