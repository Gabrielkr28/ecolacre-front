// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_endereco_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/widgets/custom_input.dart';

class PessoaJuridicaDadosPessoaisPage extends StatefulWidget {
  const PessoaJuridicaDadosPessoaisPage({super.key});

  static String route = '/pessoa-juridica-dados-pessoais-page';
  @override
  _PessoaJuridicaDadosPessoaisPageState createState() =>
      _PessoaJuridicaDadosPessoaisPageState();
}

class _PessoaJuridicaDadosPessoaisPageState
    extends State<PessoaJuridicaDadosPessoaisPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 40.0),
              const Column(
                children: [],
              ),
              CustomInput(
                labelText: 'Razão Social:',
                controller: pessoaJuridicaCubit.razaoSocialController,
              ),
              const SizedBox(height: 40.0),
              CustomInput(
                labelText: 'Nome Fantasia:',
                controller: pessoaJuridicaCubit.nomeFantasiaController,
                inputType: TextInputType.datetime,
              ),
              const SizedBox(height: 40.0),
              CustomInput(
                labelText: 'CNPJ da instituição:',
                controller: pessoaJuridicaCubit.cnpjController,
              ),
              const SizedBox(height: 40.0),
              CustomInput(
                labelText: 'CEP da instituição:',
                controller: pessoaJuridicaCubit.cepController,
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
                    // Ação do botão
                    Navigator.of(context)
                        .pushNamed(PessoaJuridicaEnderecoPage.route);
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
    );
  }
}
