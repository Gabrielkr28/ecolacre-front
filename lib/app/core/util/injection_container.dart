import 'package:get_it/get_it.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/datasources/pessoa_fisica_solicitacoes_data_source.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/data/repos/pessoa_fisica_solicitacoes_repo.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/datasources/pessoa_juridica_solicitacoes_data_source.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/data/repos/pessoa_juridica_solicitacoes_repo.dart';
import 'package:project/app/core/util/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:project/app/shared/cubit/bottom_nav_bar_cubit.dart';

final sl = GetIt.instance;
final HttpClientEcolacre<http.Response> httpClient = HttpClient();

Future<void> init() async {
  await _initPessoaFisicaSolicitacoes();
  await _initPessoaJuridicaSolicitacoes();
  await _initBottomNavBar();
}

Future _initPessoaFisicaSolicitacoes() async {
  sl
    ..registerLazySingleton(
      () => PessoaFisicaCubit(sl()),
    )
    ..registerLazySingleton<SolicitacoesRepo>(
      () => PessoaFisicaSolicitacoesRepoImpl(sl()),
    )
    ..registerLazySingleton<SolicitacoesDataSource>(
      () => PessoaFisicaSolicitacoesDataSourceImpl(httpClient),
    );
}

Future _initBottomNavBar() async {
  sl.registerLazySingleton(() => BottomNavBarCubit());
}

Future _initPessoaJuridicaSolicitacoes() async {
  sl
    ..registerFactory(
      () => PessoaJuridicaCubit(sl()),
    )
    ..registerFactory<PessoaJuridicaSolicitacoesRepoImpl>(
      () => PessoaJuridicaSolicitacoesRepoImpl(sl()),
    )
    ..registerFactory<PessoaJuridicaSolicitacoesDataSourceImpl>(
      () => PessoaJuridicaSolicitacoesDataSourceImpl(httpClient),
    );
}
