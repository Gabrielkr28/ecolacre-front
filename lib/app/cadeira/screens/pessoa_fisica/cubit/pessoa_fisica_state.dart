part of 'pessoa_fisica_cubit.dart';

sealed class PessoaFisicaState {}

final class PessoaFisicaInitial extends PessoaFisicaState {}

final class CriarSolicitacaoPessoaFisicaSuccess extends PessoaFisicaState {}

final class CriarSolicitacaoPessoaFisicaError extends PessoaFisicaState {}

final class FetchingSuccess extends PessoaFisicaState {}

final class FetchedSuccess extends PessoaFisicaState {}
