import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/models/solicitacoes_model.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/model/pessoa_juridica_solicitacao_model.dart';
import 'package:project/app/core/util/errors.dart';
import 'package:project/app/core/util/exception.dart';
import 'package:project/app/core/util/network_url.dart';

import '../../../../../core/util/http_client.dart';

abstract class SolicitacoesDataSource<T> {
  Future criarSolicitacao(T solicitaoModel);
}

class PessoaFisicaSolicitacoesDataSourceImpl
    extends SolicitacoesDataSource<SolicitacaoModel> {
  PessoaFisicaSolicitacoesDataSourceImpl(this._httpClient);

  final HttpClientEcolacre<http.Response> _httpClient;
  @override
  Future criarSolicitacao(SolicitacaoModel solicitaoModel) async {
    try {
      var result = await _httpClient.post(
        NetworkUrl.criarSolicitacaoPessoaFisica,
        data: solicitaoModel.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      if (result.statusCode == 200) {
        return result;
      } else {
        throw ClientException(ErrorString.internalError);
      }
    } on HttpException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
