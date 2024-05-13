// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/widgets/custom_input.dart';
import 'package:project/app/home/widgets/radio_button.dart';

class PessoaFisicaDadosCadeiraPage extends StatefulWidget {
  const PessoaFisicaDadosCadeiraPage({super.key});
  static String route = '/pessoa-fisica-dados-cadeira-page';

  @override
  _PessoaFisicaDadosCadeiraPageState createState() =>
      _PessoaFisicaDadosCadeiraPageState();
}

class _PessoaFisicaDadosCadeiraPageState
    extends State<PessoaFisicaDadosCadeiraPage> {
  final _formKey = GlobalKey<FormState>();

  late PessoaFisicaCubit _pessoaFisicaCubit;

  @override
  void initState() {
    _pessoaFisicaCubit = BlocProvider.of<PessoaFisicaCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
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
                  labelText: 'Qual largura de assento você deseja? (cm)',
                  controller:
                      _pessoaFisicaCubit.larguraAssentoDesejadaController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Qual menor largura de porta da sua casa? (cm)',
                  controller: _pessoaFisicaCubit.larguraPortaController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                YesNoRadioButton(
                  label: 'Possui cadeira de banho?',
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _pessoaFisicaCubit.criarSolicitacao();
                    }
                  },
                  child: const Text('Avançar'),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.teal), // Cor do texto do botão
                  ),
                  onPressed: () async {
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
