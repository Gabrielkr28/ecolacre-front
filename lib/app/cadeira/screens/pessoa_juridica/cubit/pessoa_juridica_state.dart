part of 'pessoa_juridica_cubit.dart';

sealed class PessoaJuridicaState extends Equatable {
  const PessoaJuridicaState();

  @override
  List<Object> get props => [];
}

final class PessoaJuridicaInitial extends PessoaJuridicaState {}

final class CriarSolicitacaoPessoaJuridicaLoading extends PessoaJuridicaState {}

final class CriarSolicitacaoPessoaJuridicaSuccess extends PessoaJuridicaState {}

final class CriarSolicitacaoPessoaJuridicaError extends PessoaJuridicaState {}

final class FetchingSuccess extends PessoaJuridicaState {}

final class FetchedSuccess extends PessoaJuridicaState {}
