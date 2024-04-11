// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_cadeira_page.dart';
import '../../../home/widgets/custom_input.dart';

class PessoaFisicaDadosMetragemCadeiraPage extends StatefulWidget {
  const PessoaFisicaDadosMetragemCadeiraPage({super.key});
  static String route = '/pessoa-fisica-dados-metragem-cadeira-page';
  @override
  _PessoaFisicaDadosMetragemCadeiraPageState createState() =>
      _PessoaFisicaDadosMetragemCadeiraPageState();
}

class _PessoaFisicaDadosMetragemCadeiraPageState
    extends State<PessoaFisicaDadosMetragemCadeiraPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _larguraCostasController;
  late TextEditingController _larguraQuadrilController;
  late TextEditingController _pesoController;
  late TextEditingController _alturaController;

  @override
  void initState() {
    super.initState();
    _larguraCostasController = TextEditingController();
    _larguraQuadrilController = TextEditingController();
    _pesoController = TextEditingController();
    _alturaController = TextEditingController();
  }

  @override
  void dispose() {
    _larguraCostasController.dispose();
    _larguraQuadrilController.dispose();
    _pesoController.dispose();
    _alturaController.dispose();
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
                  labelText: 'Largura das costas (cm)',
                  controller: _larguraCostasController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Quadril (cm)',
                  controller: _larguraQuadrilController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Peso (quilos)',
                  controller: _pesoController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Altura (Metros)',
                  controller: _alturaController,
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
                          .pushNamed(PessoaFisicaDadosCadeiraPage.route);
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
