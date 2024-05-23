import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/models/solicitacoes_model.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/repos/pessoa_fisica_solicitacoes_repo.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_familiar_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_pessoais_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_endereco_page.dart';
import 'package:project/app/core/util/extensions.dart';
import 'package:project/app/core/util/validator.dart';

part 'pessoa_fisica_state.dart';

class PessoaFisicaCubit extends Cubit<PessoaFisicaState> {
  PessoaFisicaCubit(this._fisicaSolicitacoesRepo)
      : super(PessoaFisicaInitial());
  final SolicitacoesRepo _fisicaSolicitacoesRepo;
  final FocusNode nameNode = FocusNode();
  final FocusNode dataNascimentoNode = FocusNode();
  final FocusNode cpfNode = FocusNode();
  final FocusNode rgNode = FocusNode();
  final FocusNode enderecoNode = FocusNode();
  final FocusNode cidadeNode = FocusNode();
  final FocusNode ufNode = FocusNode();
  final FocusNode telefoneNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  late final TextEditingController nomeController = TextEditingController();
  late final TextEditingController dataNascimentoController =
      TextEditingController();
  late final TextEditingController cpfController = TextEditingController();
  late final TextEditingController rgController = TextEditingController();
  late final TextEditingController enderecoController = TextEditingController();
  late final TextEditingController cidadeController = TextEditingController();
  late final TextEditingController ufController = TextEditingController();
  late final TextEditingController telefoneController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController qtdpessoasController =
      TextEditingController();
  late final TextEditingController rendaController = TextEditingController();
  late final TextEditingController motivoController = TextEditingController();
  late bool estuda = true;
  late bool trabalha = true;
  late bool cadeiraBanho = true;
  late final TextEditingController larguraCostasController =
      TextEditingController();
  late final TextEditingController larguraQuadrilController =
      TextEditingController();
  late final TextEditingController pesoController = TextEditingController();
  late final TextEditingController alturaController = TextEditingController();
  late final TextEditingController larguraAssentoDesejadaController =
      TextEditingController();
  late final TextEditingController larguraPortaController =
      TextEditingController();
  late final TextEditingController cadeiraBanhoController =
      TextEditingController();

  clearPessoaFisicaDadosCadeiraFields() {
    nomeController.clear();
    dataNascimentoController.clear();
    cpfController.clear();
    rgController.clear();
    nameNode.unfocus();
    dataNascimentoNode.unfocus();
    cpfNode.unfocus();
    rgNode.unfocus();
  }

  clearPessoaFisicaEnderecoFields() {
    enderecoController.clear();
    cidadeController.clear();
    ufController.clear();
    telefoneController.clear();
    emailController.clear();
    enderecoNode.unfocus();
    cidadeNode.unfocus();
    ufNode.unfocus();
    telefoneNode.unfocus();
    emailNode.unfocus();
  }

  void fetch() {
    emit(FetchingSuccess());
    emit(FetchedSuccess());
  }

  void setEstuda(bool value) {
    emit(FetchingSuccess());
    estuda = value;
    emit(FetchedSuccess());
  }

  void setTrabalha(bool value) {
    emit(FetchingSuccess());
    trabalha = value;
    emit(FetchedSuccess());
  }

  void setCadeiraBanho(bool value) {
    emit(FetchingSuccess());
    cadeiraBanho = value;
    emit(FetchedSuccess());
  }

  bool getButtonStatus(String page) {
    switch (page) {
      case PessoaFisicaDadosPessoaisPage.route:
        {
          return (TextFormValidator.validateName(
                    nomeController.text.trim(),
                  ) ==
                  null &&
              TextFormValidator.validateDate(
                    dataNascimentoController.text.trim(),
                  ) ==
                  null &&
              TextFormValidator.validateTaxVat(
                    cpfController.text.trim(),
                  ) ==
                  null &&
              rgController.text.isNotEmpty);
        }
      case PessoaFisicaEnderecoPage.route:
        {
          return (TextFormValidator.validateName(
                      enderecoController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(cidadeController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(ufController.text.trim()) ==
                  null &&
              TextFormValidator.validatePhoneNumber(
                      telefoneController.text.trim()) ==
                  null &&
              TextFormValidator.validateEmail(emailController.text.trim()) ==
                  null);
        }
      case PessoaFisicaDadosFamiliarPage.route:
        {
          return (TextFormValidator.validateQtdCadeira(
                      qtdpessoasController.text.trim()) ==
                  null &&
              TextFormValidator.validateQtdCadeira(
                      rendaController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(motivoController.text.trim()) ==
                  null);
        }
      default:
        return true;
    }
  }

  clearPessoaFisicaDadosMetragemFields() {
    enderecoController.clear();
    cidadeController.clear();
    ufController.clear();
    telefoneController.clear();
    emailController.clear();
    enderecoNode.unfocus();
    cidadeNode.unfocus();
    ufNode.unfocus();
    telefoneNode.unfocus();
    emailNode.unfocus();
  }

  Future<void> criarSolicitacao() async {
    emit(PessoaFisicaInitial());
    var result =
        await _fisicaSolicitacoesRepo.criarSolicitacao(SolicitacaoModel(
      nome: nomeController.text.trim(),
      cpf: cpfController.text.formattedTaxVat,
      dataNascimento: dataNascimentoController.text,
      endereco: enderecoController.text,
      cidade: cidadeController.text,
      telefone: telefoneController.text,
      rg: rgController.text,
      uf: ufController.text,
      email: emailController.text,
      rendaFamiliarMedia: rendaController.text,
      estuda: estuda,
      trabalha: trabalha,
      concordaTermosProjeto: true,
      razaoCadeiraRodas: motivoController.text,
      larguraCostasCm: int.tryParse(larguraCostasController.text),
      pesoKg: int.tryParse(pesoController.text),
      quadrilCm: int.tryParse(larguraQuadrilController.text),
      alturaCm: int.tryParse(alturaController.text),
      menorLarguraPortaCm: int.tryParse(larguraPortaController.text),
      larguraAssentoCm: int.tryParse(larguraAssentoDesejadaController.text),
      //TODO - esses campos nao existem
      responsavelNome: 'mock temporario',
      responsavelTelefone: "mock temporario",
      responsavelEmail: "mock temporario",
    ));
    result.fold((failure) => emit(CriarSolicitacaoPessoaFisicaError()),
        (success) => emit(CriarSolicitacaoPessoaFisicaSuccess()));
  }
}
