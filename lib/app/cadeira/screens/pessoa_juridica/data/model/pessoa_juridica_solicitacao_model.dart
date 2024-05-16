class SolicitacaoJuridicaModel {
  String? razaoSocial;
  String? nomeFantasia;
  String? cnpj;
  String? endereco;
  String? cidade;
  String? telefone;
  String? uf;
  String? cep;
  String? email;
  String? atividadesDesempenhadas;
  bool? incentivoFinanceiro;
  int? mediaPessoasBenefMensal;
  int? qtdCadeiraRodasInstituicao;
  bool? cadeiraRodasEmprestadas;
  String? descModeloCadeiraRodas;
  String? responsavelNome;
  String? responsavelTelefone;
  String? responsavelEmail;
  bool? concordaTermosProjeto;
  String? razaoCadeiraRodas;

  SolicitacaoJuridicaModel(
      {this.razaoSocial,
      this.nomeFantasia,
      this.cnpj,
      this.endereco,
      this.cidade,
      this.telefone,
      this.uf,
      this.cep,
      this.email,
      this.atividadesDesempenhadas,
      this.incentivoFinanceiro,
      this.mediaPessoasBenefMensal,
      this.qtdCadeiraRodasInstituicao,
      this.cadeiraRodasEmprestadas,
      this.descModeloCadeiraRodas,
      this.responsavelNome,
      this.responsavelTelefone,
      this.responsavelEmail,
      this.concordaTermosProjeto,
      this.razaoCadeiraRodas});

  SolicitacaoJuridicaModel.fromJson(Map<String, dynamic> json) {
    razaoSocial = json['razao_social'];
    nomeFantasia = json['nome_fantasia'];
    cnpj = json['cnpj'];
    endereco = json['endereco'];
    cidade = json['cidade'];
    telefone = json['telefone'];
    uf = json['uf'];
    cep = json['cep'];
    email = json['email'];
    atividadesDesempenhadas = json['atividades_desempenhadas'];
    incentivoFinanceiro = json['incentivo_financeiro'];
    mediaPessoasBenefMensal = json['media_pessoas_benef_mensal'];
    qtdCadeiraRodasInstituicao = json['qtd_cadeira_rodas_instituicao'];
    cadeiraRodasEmprestadas = json['cadeira_rodas_emprestadas'];
    descModeloCadeiraRodas = json['desc_modelo_cadeira_rodas'];
    responsavelNome = json['responsavel_nome'];
    responsavelTelefone = json['responsavel_telefone'];
    responsavelEmail = json['responsavel_email'];
    concordaTermosProjeto = json['concorda_termos_projeto'];
    razaoCadeiraRodas = json['razao_cadeira_rodas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['razao_social'] = razaoSocial;
    data['nome_fantasia'] = nomeFantasia;
    data['cnpj'] = cnpj;
    data['endereco'] = endereco;
    data['cidade'] = cidade;
    data['telefone'] = telefone;
    data['uf'] = uf;
    data['cep'] = cep;
    data['email'] = email;
    data['atividades_desempenhadas'] = atividadesDesempenhadas;
    data['incentivo_financeiro'] = incentivoFinanceiro;
    data['media_pessoas_benef_mensal'] = mediaPessoasBenefMensal;
    data['qtd_cadeira_rodas_instituicao'] = qtdCadeiraRodasInstituicao;
    data['cadeira_rodas_emprestadas'] = cadeiraRodasEmprestadas;
    data['desc_modelo_cadeira_rodas'] = descModeloCadeiraRodas;
    data['responsavel_nome'] = responsavelNome;
    data['responsavel_telefone'] = responsavelTelefone;
    data['responsavel_email'] = responsavelEmail;
    data['concorda_termos_projeto'] = concordaTermosProjeto;
    data['razao_cadeira_rodas'] = razaoCadeiraRodas;
    return data;
  }
}
