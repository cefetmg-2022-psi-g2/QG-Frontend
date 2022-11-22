class Usuario {
  String usuario;
  String email;
  String dataNascimento;
  String telefone;
  String sexo;
  String confirmacaoSenha;

  Usuario(
      {required this.usuario,
      required this.email,
      required this.dataNascimento,
      required this.telefone,
      this.sexo = "",
      required this.confirmacaoSenha});

  Map toJson() => {
        'username': usuario,
        'email': email,
        'date_birth': dataNascimento,
        'phone': telefone,
        'gender': sexo,
        'confirma': confirmacaoSenha,
      };
}
