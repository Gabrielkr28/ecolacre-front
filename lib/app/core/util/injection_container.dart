import 'package:get_it/get_it.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/datasources/pessoa_fisica_solicitacoes_data_source.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/repos/pessoa_fisica_solicitacoes_repo.dart';
import 'package:project/app/core/util/http_client.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
final HttpClientEcolacre<http.Response> httpClient = HttpClient();

Future<void> init() async {
  await _initPessoaFisicaSolicitacoes();
}

Future _initPessoaFisicaSolicitacoes() async {
  sl
    ..registerLazySingleton(() => PessoaFisicaCubit(sl()))
    ..registerLazySingleton<PessoaFisicaSolicitacoesRepo>(
        () => PessoaFisicaSolicitacoesRepoImpl(sl()))
    ..registerLazySingleton<PessoaFisicaSolicitacoesDataSource>(
        () => PessoaFisicaSolicitacoesDataSourceImpl(httpClient));
}
