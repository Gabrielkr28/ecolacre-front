// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_detalhes_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/shared/validator/address_input_formatter.dart';
import 'package:project/app/shared/validator/email_input_formatter.dart';
import 'package:project/app/shared/validator/name_input_formatter.dart';
import 'package:project/app/shared/validator/phone_input_formatter.dart';
import 'package:project/app/shared/widgets/standart_button.dart';
import 'package:project/app/shared/widgets/standart_text_field.dart';

class PessoaJuridicaEnderecoPage extends StatefulWidget {
  const PessoaJuridicaEnderecoPage({super.key});
  static const String route = '/pessoa-juridica-endereco-page';

  @override
  _PessoaJuridicaEnderecoPageState createState() =>
      _PessoaJuridicaEnderecoPageState();
}

class _PessoaJuridicaEnderecoPageState
    extends State<PessoaJuridicaEnderecoPage> {
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    StandardTextField(
                      onChanged: (value) => pessoaJuridicaCubit.fetch(),
                      compoundableFormatter: EnderecoInputFormatter(),
                      controller: pessoaJuridicaCubit.enderecoController,
                    ),
                    StandardTextField(
                      onChanged: (value) => pessoaJuridicaCubit.fetch(),
                      compoundableFormatter: CidadeInputFormatter(),
                      controller: pessoaJuridicaCubit.cidadeController,
                    ),
                    StandardTextField(
                      onChanged: (value) => pessoaJuridicaCubit.fetch(),
                      compoundableFormatter: StateInputFormatter(),
                      controller: pessoaJuridicaCubit.ufController,
                    ),
                    StandardTextField(
                      onChanged: (value) => pessoaJuridicaCubit.fetch(),
                      compoundableFormatter: PhoneInputFormatter(
                          controller: pessoaJuridicaCubit.telefoneController),
                      controller: pessoaJuridicaCubit.telefoneController,
                    ),
                    StandardTextField(
                      onChanged: (value) => pessoaJuridicaCubit.fetch(),
                      compoundableFormatter: EmailInputFormatter(),
                      controller: pessoaJuridicaCubit.emailController,
                    ),
                    StandardButton(
                      onPressed: () => Navigator.pushNamed(
                          context, PessoaJuridicaDetalhesPage.route),
                      enabled: pessoaJuridicaCubit
                          .getButtonStatus(PessoaJuridicaEnderecoPage.route),
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
                          pessoaJuridicaCubit.clearEnderecosFields(),
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
