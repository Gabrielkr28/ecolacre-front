import 'package:dartz/dartz.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/repos/pessoa_fisica_solicitacoes_repo.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/datasources/pessoa_juridica_solicitacoes_data_source.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/model/pessoa_juridica_solicitacao_model.dart';
import 'package:project/app/core/util/exception.dart';
import 'package:project/app/core/util/failures.dart';
import 'package:project/app/core/util/type_defs.dart';

class PessoaJuridicaSolicitacoesRepoImpl
    extends SolicitacoesRepo<SolicitacaoJuridicaModel> {
  final PessoaJuridicaSolicitacoesDataSourceImpl _solicitacoesDataSource;

  PessoaJuridicaSolicitacoesRepoImpl(this._solicitacoesDataSource);
  @override
  ResultFuture criarSolicitacao(SolicitacaoJuridicaModel solicitaoModel) async {
    try {
      final result =
          await _solicitacoesDataSource.criarSolicitacao(solicitaoModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
