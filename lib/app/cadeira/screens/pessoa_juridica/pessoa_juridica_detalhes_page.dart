// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_cadeira_page.dart';
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
  late TextEditingController _segmentoController;
  late TextEditingController _qtdColaboradoresController;
  late TextEditingController _incentivoFinanceiroController;
  late TextEditingController _possuiCadeirasController;

  @override
  void initState() {
    super.initState();
    _segmentoController = TextEditingController();
    _qtdColaboradoresController = TextEditingController();
    _incentivoFinanceiroController = TextEditingController();
    _possuiCadeirasController = TextEditingController();
  }

  @override
  void dispose() {
    _segmentoController.dispose();
    _qtdColaboradoresController.dispose();
    _incentivoFinanceiroController.dispose();
    _possuiCadeirasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: _segmentoController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Quantidade Colaboradores:',
                  controller: _qtdColaboradoresController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Recebe algum incentivo Financeiro:',
                  controller: _incentivoFinanceiroController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Possui cadeiras de rodas?:',
                  controller: _possuiCadeirasController,
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
