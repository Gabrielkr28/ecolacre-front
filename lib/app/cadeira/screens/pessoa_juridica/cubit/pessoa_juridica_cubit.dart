import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/model/pessoa_juridica_solicitacao_model.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/repos/pessoa_juridica_solicitacoes_repo.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_cadeira_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_pessoais.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_detalhes_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_endereco_page.dart';
import 'package:project/app/core/util/validator.dart';

part 'pessoa_juridica_state.dart';

class PessoaJuridicaCubit extends Cubit<PessoaJuridicaState> {
  PessoaJuridicaCubit(this._fisicaSolicitacoesRepo)
      : super(PessoaJuridicaInitial());
  final PessoaJuridicaSolicitacoesRepoImpl _fisicaSolicitacoesRepo;
  late final TextEditingController razaoSocialController =
      TextEditingController();
  late final TextEditingController nomeFantasiaController =
      TextEditingController();
  late final TextEditingController cnpjController = TextEditingController();
  late final TextEditingController cepController = TextEditingController();
  late TextEditingController enderecoController = TextEditingController();
  late TextEditingController cidadeController = TextEditingController();
  late TextEditingController ufController = TextEditingController();
  late TextEditingController telefoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController segmentoController = TextEditingController();
  late TextEditingController qtdColaboradoresController =
      TextEditingController();
  late TextEditingController incentivoFinanceiroController =
      TextEditingController();
  late final TextEditingController usoCadeiraController =
      TextEditingController();
  late final TextEditingController modeloCadeiraController =
      TextEditingController();
  late TextEditingController qtdCadeirasDeRodasController =
      TextEditingController();

  clearDadosPessoaisFields() {
    razaoSocialController.clear();
    nomeFantasiaController.clear();
    cnpjController.clear();
    cepController.clear();
  }

  clearEnderecosFields() {
    enderecoController.clear();
    cidadeController.clear();
    ufController.clear();
    telefoneController.clear();
    emailController.clear();
  }

  bool getButtonStatus(String page) {
    switch (page) {
      case PessoaJuridicaDadosPessoaisPage.route:
        {
          return (TextFormValidator.validateName(
                      nomeFantasiaController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(
                      razaoSocialController.text.trim()) ==
                  null &&
              TextFormValidator.validateCEP(cepController.text.trim()) ==
                  null &&
              TextFormValidator.validateCnpj(cnpjController.text.trim()) ==
                  null);
        }
      case PessoaJuridicaEnderecoPage.route:
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
      case PessoaJuridicaDetalhesPage.route:
        {
          return (TextFormValidator.validateName(
                      segmentoController.text.trim()) ==
                  null &&
              TextFormValidator.validateQtdColaboradores(
                      qtdColaboradoresController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(
                      incentivoFinanceiroController.text.trim()) ==
                  null &&
              TextFormValidator.validateQtdCadeira(
                      qtdCadeirasDeRodasController.text.trim()) ==
                  null);
        }
      case PessoaJuridicaDadosCadeiraPage.route:
        {
          return (TextFormValidator.validateName(
                      usoCadeiraController.text.trim()) ==
                  null &&
              TextFormValidator.validateName(
                      modeloCadeiraController.text.trim()) ==
                  null);
        }
      default:
        return false;
    }
  }

  void fetch() {
    emit(FetchingSuccess());
    emit(FetchedSuccess());
  }

  Future<void> criarSolicitacao() async {
    emit(CriarSolicitacaoPessoaJuridicaLoading());
    try {
      await _fisicaSolicitacoesRepo.criarSolicitacao(SolicitacaoJuridicaModel(
        cep: cepController.text.trim(),
        cidade: cidadeController.text.trim(),
        cnpj: cnpjController.text.trim(),
        email: emailController.text.trim(),
        endereco: enderecoController.text.trim(),
        nomeFantasia: nomeFantasiaController.text.trim(),
        razaoSocial: razaoSocialController.text.trim(),
        uf: ufController.text.trim(),
        telefone: telefoneController.text.trim(),
        atividadesDesempenhadas: 'mock',
        // atividadesDesempenhadas: possuiCadeirasController.text.trim(),
        //TODO esses campos nao existem
        qtdCadeiraRodasInstituicao: 5,
        cadeiraRodasEmprestadas: true,
        concordaTermosProjeto: true,
        descModeloCadeiraRodas: 'mock temporario',
        incentivoFinanceiro: true,
        mediaPessoasBenefMensal: 5,
        razaoCadeiraRodas: 'mock temporario',
        responsavelTelefone: 'mock temporario',
        responsavelEmail: 'mock temporario',
        responsavelNome: 'mock temporario',
      ));
      emit(CriarSolicitacaoPessoaJuridicaSuccess());
    } catch (e) {
      emit(CriarSolicitacaoPessoaJuridicaError());
    }
  }
}
