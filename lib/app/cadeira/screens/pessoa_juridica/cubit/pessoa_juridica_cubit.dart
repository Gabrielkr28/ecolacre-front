import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/model/pessoa_juridica_solicitacao_model.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/repos/pessoa_juridica_solicitacoes_repo.dart';

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
  late TextEditingController possuiCadeirasController = TextEditingController();

  Future<void> criarSolicitacao() async {
    emit(PessoaJuridicaInitial());
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
        atividadesDesempenhadas: possuiCadeirasController.text.trim(),
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
