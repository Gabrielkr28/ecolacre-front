import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_cadeira_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_familiar_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_metragem_cadeira.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_pessoais_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_endereco_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_cadeira_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_pessoais.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_detalhes_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_endereco_page.dart';
import 'package:project/app/home/screens/home_page.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.route: (context) => const HomePage(),
  //cadeira
  CadeiraPessoaFisicaJuridicaPage.route: (context) =>
      const CadeiraPessoaFisicaJuridicaPage(),
  //pessoa fisica
  PessoaFisicaDadosPessoaisPage.route: (context) =>
      const PessoaFisicaDadosPessoaisPage(),
  PessoaFisicaDadosMetragemCadeiraPage.route: (context) =>
      const PessoaFisicaDadosMetragemCadeiraPage(),
  PessoaFisicaEnderecoPage.route: (context) => const PessoaFisicaEnderecoPage(),
  PessoaFisicaDadosFamiliarPage.route: (context) =>
      const PessoaFisicaDadosFamiliarPage(),
  PessoaFisicaDadosCadeiraPage.route: (context) =>
      const PessoaFisicaDadosCadeiraPage(),

  //pessoa juridica
  PessoaJuridicaDadosCadeiraPage.route: (context) =>
      const PessoaJuridicaDadosCadeiraPage(),
  PessoaJuridicaDadosPessoaisPage.route: (context) =>
      const PessoaJuridicaDadosPessoaisPage(),
  PessoaJuridicaDetalhesPage.route: (context) =>
      const PessoaJuridicaDetalhesPage(),
  PessoaJuridicaEnderecoPage.route: (context) =>
      const PessoaJuridicaEnderecoPage(),
};
