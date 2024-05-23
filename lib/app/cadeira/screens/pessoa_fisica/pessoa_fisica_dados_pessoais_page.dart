// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_endereco_page.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/shared/validator/data_input_formatter.dart';
import 'package:project/app/shared/validator/name_input_formatter.dart';
import 'package:project/app/shared/validator/tax_vat_input_formatter.dart';
import 'package:project/app/shared/widgets/standart_button.dart';
import 'package:project/app/shared/widgets/standart_text_field.dart';

class PessoaFisicaDadosPessoaisPage extends StatefulWidget {
  const PessoaFisicaDadosPessoaisPage({super.key});
  static const String route = '/pessoa-fisica-dados-pessoais-page';

  @override
  _PessoaFisicaDadosPessoaisPageState createState() =>
      _PessoaFisicaDadosPessoaisPageState();
}

class _PessoaFisicaDadosPessoaisPageState
    extends State<PessoaFisicaDadosPessoaisPage> {
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
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: NameInputFormatter(),
                      controller: _pessoaFisicaCubit.nomeController,
                    ),
                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: DataInputFormatter(
                          controller:
                              _pessoaFisicaCubit.dataNascimentoController),
                      controller: _pessoaFisicaCubit.dataNascimentoController,
                    ),
                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: TaxVatInputFormatter(
                          controller: _pessoaFisicaCubit.cpfController),
                      controller: _pessoaFisicaCubit.cpfController,
                    ),
                    StandardTextField(
                      onChanged: (value) => _pessoaFisicaCubit.fetch(),
                      compoundableFormatter: RgInputFormatter(
                          controller: _pessoaFisicaCubit.rgController),
                      controller: _pessoaFisicaCubit.rgController,
                    ),
                    StandardButton(
                      onPressed: () => Navigator.pushNamed(
                          context, PessoaFisicaEnderecoPage.route),
                      enabled: _pessoaFisicaCubit
                          .getButtonStatus(PessoaFisicaDadosPessoaisPage.route),
                      text: 'Avançar',
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.teal), // Cor do texto do botão
                      ),
                      onPressed: () {
                        _pessoaFisicaCubit
                            .clearPessoaFisicaDadosCadeiraFields();
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
