// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/screens/home_page.dart';
import 'package:project/app/home/widgets/custom_input.dart';

class PessoaJuridicaDadosCadeiraPage extends StatefulWidget {
  const PessoaJuridicaDadosCadeiraPage({super.key});
  static String route = '/pessoa-juridica-dados-cadeira-page';
  @override
  _PessoaJuridicaDadosCadeiraPageState createState() =>
      _PessoaJuridicaDadosCadeiraPageState();
}

class _PessoaJuridicaDadosCadeiraPageState
    extends State<PessoaJuridicaDadosCadeiraPage> {
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
    return BlocListener<PessoaJuridicaCubit, PessoaJuridicaState>(
      listener: (context, state) {
        if (state is CriarSolicitacaoPessoaJuridicaSuccess) {
          IconSnackBar.show(context,
              snackBarType: SnackBarType.success,
              label: 'Cadeira solicitada!',
              snackBarStyle: const SnackBarStyle(
                  labelTextStyle: TextStyle(fontWeight: FontWeight.bold)));
          Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.popAndPushNamed(context, HomePage.route),
          );
        }
        if (state is CriarSolicitacaoPessoaJuridicaError) {
          IconSnackBar.show(context,
              snackBarType: SnackBarType.fail,
              label: 'Ops, algo aconteceu!',
              snackBarStyle: const SnackBarStyle(
                  backgroundColor: Color.fromARGB(255, 219, 92, 92),
                  labelTextStyle: TextStyle(fontWeight: FontWeight.bold)));
          Future.delayed(
            const Duration(seconds: 2),
            () => Navigator.popAndPushNamed(context, HomePage.route),
          );
        }
      },
      child: Scaffold(
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
                    labelText:
                        'Cadeiras para uso da instituição ou empréstimo:',
                    controller: pessoaJuridicaCubit.usoCadeiraController,
                  ),
                  const SizedBox(height: 40.0),
                  CustomInput(
                    labelText: 'Modelo ou caracteristicas da cadeira de rodas:',
                    controller: pessoaJuridicaCubit.modeloCadeiraController,
                    inputType: TextInputType.datetime,
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
                        pessoaJuridicaCubit.criarSolicitacao();
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
      ),
    );
  }
}
