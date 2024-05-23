// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_endereco_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/shared/validator/cep_input_formatter.dart';
import 'package:project/app/shared/validator/name_input_formatter.dart';
import 'package:project/app/shared/validator/tax_vat_input_formatter.dart';
import 'package:project/app/shared/widgets/standart_button.dart';
import 'package:project/app/shared/widgets/standart_text_field.dart';

class PessoaJuridicaDadosPessoaisPage extends StatefulWidget {
  const PessoaJuridicaDadosPessoaisPage({super.key});

  static const String route = '/pessoa-juridica-dados-pessoais-page';
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
    return BlocBuilder<PessoaJuridicaCubit, PessoaJuridicaState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 245, 245, 245),
            height: MediaQuery.of(context).size.height * 0.1,
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
                  const Column(
                    children: [],
                  ),
                  StandardTextField(
                    onChanged: (value) => pessoaJuridicaCubit.fetch(),
                    compoundableFormatter: RazaoSocialFormatter(),
                    controller: pessoaJuridicaCubit.razaoSocialController,
                  ),
                  StandardTextField(
                    onChanged: (value) => pessoaJuridicaCubit.fetch(),
                    compoundableFormatter: UsoCadeiraInputFormatter(),
                    controller: pessoaJuridicaCubit.nomeFantasiaController,
                  ),
                  StandardTextField(
                    onChanged: (value) => pessoaJuridicaCubit.fetch(),
                    compoundableFormatter: CnpjInputFormatter(
                        controller: pessoaJuridicaCubit.cnpjController),
                    controller: pessoaJuridicaCubit.cnpjController,
                  ),
                  StandardTextField(
                    onChanged: (value) => pessoaJuridicaCubit.fetch(),
                    compoundableFormatter: CepInputFormatter(
                        controller: pessoaJuridicaCubit.cepController),
                    controller: pessoaJuridicaCubit.cepController,
                  ),
                  StandardButton(
                    onPressed: () => Navigator.pushNamed(
                        context, PessoaJuridicaEnderecoPage.route),
                    enabled: pessoaJuridicaCubit
                        .getButtonStatus(PessoaJuridicaDadosPessoaisPage.route),
                    text: 'Avançar',
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.black), // Cor do texto do botão
                    ),
                    onPressed: () =>
                        pessoaJuridicaCubit.clearDadosPessoaisFields(),
                    child: const Text('Limpar formulário'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
