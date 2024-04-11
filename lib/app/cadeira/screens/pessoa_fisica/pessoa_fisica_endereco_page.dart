// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_familiar_page.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_metragem_cadeira.dart';
import 'package:project/app/home/widgets/custom_input.dart';

class PessoaFisicaEnderecoPage extends StatefulWidget {
  const PessoaFisicaEnderecoPage({super.key});
  static String route = '/pessoa-fisica-endereco-page';

  @override
  _PessoaFisicaEnderecoPageState createState() =>
      _PessoaFisicaEnderecoPageState();
}

class _PessoaFisicaEnderecoPageState extends State<PessoaFisicaEnderecoPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _enderecoController;
  late TextEditingController _cidadeController;
  late TextEditingController _ufController;
  late TextEditingController _telefoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _enderecoController = TextEditingController();
    _cidadeController = TextEditingController();
    _ufController = TextEditingController();
    _telefoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _enderecoController.dispose();
    _cidadeController.dispose();
    _ufController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
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
                  labelText: 'Endereço',
                  controller: _enderecoController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Cidade',
                  controller: _cidadeController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'UF',
                  controller: _ufController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Telefone',
                  controller: _telefoneController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'E-mail',
                  controller: _emailController,
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
                          .pushNamed(PessoaFisicaDadosFamiliarPage.route);
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