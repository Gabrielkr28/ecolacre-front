// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_familiar_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_endereco_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/widgets/custom_input.dart';
import 'package:project/app/shared/validator/address_input_formatter.dart';
import 'package:project/app/shared/validator/email_input_formatter.dart';
import 'package:project/app/shared/validator/name_input_formatter.dart';
import 'package:project/app/shared/validator/phone_input_formatter.dart';
import 'package:project/app/shared/widgets/standart_button.dart';
import 'package:project/app/shared/widgets/standart_text_field.dart';

class PessoaFisicaEnderecoPage extends StatefulWidget {
  const PessoaFisicaEnderecoPage({super.key});
  static const String route = '/pessoa-fisica-endereco-page';

  @override
  _PessoaFisicaEnderecoPageState createState() =>
      _PessoaFisicaEnderecoPageState();
}

class _PessoaFisicaEnderecoPageState extends State<PessoaFisicaEnderecoPage> {
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
    return BlocBuilder<PessoaFisicaCubit, PessoaFisicaState>(
      builder: (context, state) {
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
                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: EnderecoInputFormatter(),
                      controller: _pessoaFisicaCubit.enderecoController,
                    ),

                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: CidadeInputFormatter(),
                      controller: _pessoaFisicaCubit.cidadeController,
                    ),

                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: StateInputFormatter(),
                      controller: _pessoaFisicaCubit.ufController,
                    ),
                    //TODO vitor - trocar por dropdown

                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: PhoneInputFormatter(
                          controller: _pessoaFisicaCubit.telefoneController),
                      controller: _pessoaFisicaCubit.telefoneController,
                    ),

                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: EmailInputFormatter(),
                      controller: _pessoaFisicaCubit.emailController,
                    ),

                    // ElevatedButton(
                    //   style: ButtonStyle(
                    //     backgroundColor: MaterialStateProperty.all<Color>(
                    //         Colors.teal), // Cor de fundo do botão
                    //     foregroundColor: MaterialStateProperty.all<Color>(
                    //         Colors.white), // Cor do texto do botão
                    //   ),
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       Navigator.of(context)
                    //           .pushNamed(PessoaFisicaDadosFamiliarPage.route);
                    //     }
                    //   },
                    //   child: const Text('Avançar'),
                    // ),
                    StandardButton(
                      onPressed: () => Navigator.pushNamed(
                          context, PessoaFisicaDadosFamiliarPage.route),
                      enabled: _pessoaFisicaCubit
                          .getButtonStatus(PessoaFisicaEnderecoPage.route),
                      text: 'Avançar',
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.teal), // Cor do texto do botão
                      ),
                      onPressed: () {
                        _pessoaFisicaCubit.clearPessoaFisicaEnderecoFields();
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
      },
    );
  }
}
