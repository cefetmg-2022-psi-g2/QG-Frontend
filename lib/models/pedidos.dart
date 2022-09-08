class Pedido {

  String item; 
  int campus;
  int predio;
  String complemento;
  String categoria;
  String? observacoes;
  
  Pedido({required this.item, required this.campus, required this.predio, 
    required this.complemento, required this.categoria, this.observacoes = null});

}