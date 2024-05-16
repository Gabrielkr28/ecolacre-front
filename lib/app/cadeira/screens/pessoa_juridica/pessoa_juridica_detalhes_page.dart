// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_cadeira_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/widgets/custom_input.dart';

class PessoaJuridicaDetalhesPage extends StatefulWidget {
  const PessoaJuridicaDetalhesPage({super.key});
  static String route = '/pessoa-juridica-detalhes-page';
  @override
  _PessoaJuridicaDetalhesPageState createState() =>
      _PessoaJuridicaDetalhesPageState();
}

class _PessoaJuridicaDetalhesPageState
    extends State<PessoaJuridicaDetalhesPage> {
  final _formKey = GlobalKey<FormState>();
  late PessoaJuridicaCubit pessoaJuridicaCubit;
  @override
  void initState() {
    pessoaJuridicaCubit = BlocProvider.of<PessoaJuridicaCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        height: 100,
        child: const BottomNavBar(),
      ),
      appBar: AppBar(
        title: const Text(
          'Solicitar cadeira de rodas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.white, // Customize the app bar color
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Text(
            'Leia atentamente ao regulamento clicando aqui antes de solicitar sua cadeira de rodas.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Segmento instituição:',
                  controller: pessoaJuridicaCubit.segmentoController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Quantidade Colaboradores:',
                  controller: pessoaJuridicaCubit.qtdColaboradoresController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Recebe algum incentivo Financeiro:',
                  controller: pessoaJuridicaCubit.incentivoFinanceiroController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Possui cadeiras de rodas?:',
                  controller: pessoaJuridicaCubit.possuiCadeirasController,
                ),
                const SizedBox(height: 80.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal), // Cor de fundo do botão
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Cor do texto do botão
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .pushNamed(PessoaJuridicaDadosCadeiraPage.route);
                    }
                  },
                  child: const Text('Avançar'),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal), // Cor do texto do botão
                  ),
                  onPressed: () {
                    // Ação para limpar o formulário
                  },
                  child: const Text('Limpar formulário'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
