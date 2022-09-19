class Usuario {

  String usuario; 
  String email;
  DateTime dataNascimento;
  String telefone;
  String sexo;
  String senha;
  String confirmacaoSenha;
  
  Usuario({required this.usuario, required this.email, required this.dataNascimento, 
    required this.telefone, this.sexo = "", required this.senha, required this.confirmacaoSenha});

}