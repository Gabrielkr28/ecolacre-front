import 'package:dartz/dartz.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/datasources/pessoa_fisica_solicitacoes_data_source.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/models/solicitacoes_model.dart';
import 'package:project/app/core/util/exception.dart';
import 'package:project/app/core/util/failures.dart';
import 'package:project/app/core/util/type_defs.dart';

abstract class PessoaFisicaSolicitacoesRepo {
  ResultFuture criarSolicitacao(SolicitacaoModel solicitaoModel);
}

class PessoaFisicaSolicitacoesRepoImpl extends PessoaFisicaSolicitacoesRepo {
  PessoaFisicaSolicitacoesRepoImpl(this._pessoaFisicaSolicitacoesDataSource);
  final PessoaFisicaSolicitacoesDataSource _pessoaFisicaSolicitacoesDataSource;
  @override
  ResultFuture criarSolicitacao(SolicitacaoModel solicitaoModel) async {
    try {
      final result = await _pessoaFisicaSolicitacoesDataSource
          .criarSolicitacao(solicitaoModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
