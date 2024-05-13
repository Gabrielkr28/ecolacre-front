class SolicitacaoModel {
  String? nome;
  String? cpf;
  String? dataNascimento;
  String? endereco;
  String? cidade;
  String? telefone;
  String? rg;
  String? uf;
  String? email;
  String? rendaFamiliarMedia;
  bool? estuda;
  bool? trabalha;
  bool? concordaTermosProjeto;
  String? razaoCadeiraRodas;
  int? larguraCostasCm;
  int? pesoKg;
  int? quadrilCm;
  int? alturaCm;
  int? menorLarguraPortaCm;
  int? larguraAssentoCm;
  String? responsavelNome;
  String? responsavelTelefone;
  String? responsavelEmail;

  SolicitacaoModel(
      {this.nome,
      this.cpf,
      this.dataNascimento,
      this.endereco,
      this.cidade,
      this.telefone,
      this.rg,
      this.uf,
      this.email,
      this.rendaFamiliarMedia,
      this.estuda,
      this.trabalha,
      this.concordaTermosProjeto,
      this.razaoCadeiraRodas,
      this.larguraCostasCm,
      this.pesoKg,
      this.quadrilCm,
      this.alturaCm,
      this.menorLarguraPortaCm,
      this.larguraAssentoCm,
      this.responsavelNome,
      this.responsavelTelefone,
      this.responsavelEmail});

  SolicitacaoModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cpf = json['cpf'];
    dataNascimento = json['data_nascimento'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    telefone = json['telefone'];
    rg = json['rg'];
    uf = json['uf'];
    email = json['email'];
    rendaFamiliarMedia = json['renda_familiar_media'];
    estuda = json['estuda'];
    trabalha = json['trabalha'];
    concordaTermosProjeto = json['concorda_termos_projeto'];
    razaoCadeiraRodas = json['razao_cadeira_rodas'];
    larguraCostasCm = json['largura_costas_cm'];
    pesoKg = json['peso_kg'];
    quadrilCm = json['quadril_cm'];
    alturaCm = json['altura_cm'];
    menorLarguraPortaCm = json['menor_largura_porta_cm'];
    larguraAssentoCm = json['largura_assento_cm'];
    responsavelNome = json['responsavel_nome'];
    responsavelTelefone = json['responsavel_telefone'];
    responsavelEmail = json['responsavel_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['data_nascimento'] = dataNascimento;
    data['endereco'] = endereco;
    data['cidade'] = cidade;
    data['telefone'] = telefone;
    data['rg'] = rg;
    data['uf'] = uf;
    data['email'] = email;
    data['renda_familiar_media'] = rendaFamiliarMedia;
    data['estuda'] = estuda;
    data['trabalha'] = trabalha;
    data['concorda_termos_projeto'] = concordaTermosProjeto;
    data['razao_cadeira_rodas'] = razaoCadeiraRodas;
    data['largura_costas_cm'] = larguraCostasCm;
    data['peso_kg'] = pesoKg;
    data['quadril_cm'] = quadrilCm;
    data['altura_cm'] = alturaCm;
    data['menor_largura_porta_cm'] = menorLarguraPortaCm;
    data['largura_assento_cm'] = larguraAssentoCm;
    data['responsavel_nome'] = responsavelNome;
    data['responsavel_telefone'] = responsavelTelefone;
    data['responsavel_email'] = responsavelEmail;
    return data;
  }
}
