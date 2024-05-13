part of 'pessoa_fisica_cubit.dart';

sealed class PessoaFisicaState {}

final class PessoaFisicaInitial extends PessoaFisicaState {}

final class CriarPessoaFisicaSuccess extends PessoaFisicaState {}

final class CriarPessoaFisicaError extends PessoaFisicaState {}
