// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_metragem_cadeira.dart';
import 'package:project/app/home/widgets/custom_input.dart';
import 'package:project/app/home/widgets/radio_button.dart';

class PessoaFisicaDadosFamiliarPage extends StatefulWidget {
  const PessoaFisicaDadosFamiliarPage({super.key});
  static String route = '/pessoa-fisica-dados-familiar-page';

  @override
  _PessoaFisicaDadosFamiliarPageState createState() =>
      _PessoaFisicaDadosFamiliarPageState();
}

class _PessoaFisicaDadosFamiliarPageState
    extends State<PessoaFisicaDadosFamiliarPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _qtdpessoasController;
  late TextEditingController _rendaController;
  late TextEditingController _motivoController;
  late TextEditingController _estudaController;
  late TextEditingController _trabalhaController;

  @override
  void initState() {
    super.initState();
    _qtdpessoasController = TextEditingController();
    _rendaController = TextEditingController();
    _motivoController = TextEditingController();
    _estudaController = TextEditingController();
    _trabalhaController = TextEditingController();
  }

  @override
  void dispose() {
    _qtdpessoasController.dispose();
    _rendaController.dispose();
    _motivoController.dispose();
    _estudaController.dispose();
    _trabalhaController.dispose();
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
                  labelText: 'Quantas pessoas vivem na sua casa?',
                  controller: _qtdpessoasController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Renda Familiar Média',
                  controller: _rendaController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Porque você precisa da cadeira de rodas?',
                  controller: _motivoController,
                ),
                const SizedBox(height: 40.0),
                YesNoRadioButton(
                  label: 'Você estuda?',
                  onSelection: (bool? value) {},
                ),
                const SizedBox(height: 40.0),
                YesNoRadioButton(
                  label: 'Você Trabalha?',
                  onSelection: (bool? value) {},
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
                      Navigator.of(context).pushNamed(
                          PessoaFisicaDadosMetragemCadeiraPage.route);
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
