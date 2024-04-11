// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_pessoais_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_pessoais.dart';

class CadeiraPessoaFisicaJuridicaPage extends StatefulWidget {
  const CadeiraPessoaFisicaJuridicaPage({super.key});
  static String route = '/cadeira-pessoa-fisica-juridica-page';

  @override
  _CadeiraPessoaFisicaJuridicaPageState createState() =>
      _CadeiraPessoaFisicaJuridicaPageState();
}

class _CadeiraPessoaFisicaJuridicaPageState
    extends State<CadeiraPessoaFisicaJuridicaPage> {
  bool _agreeTerms = false;
  String _personType = 'physical';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solicitar cadeira de rodas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
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
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text(
                      'Estou ciente e concordo com os termos e condições'),
                  value: _agreeTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('Esta solicitação é destinada para:'),
                ListTile(
                  title: const Text('Pessoa física'),
                  leading: Radio<String>(
                    value: 'physical',
                    groupValue: _personType,
                    onChanged: (String? value) {
                      setState(() {
                        _personType = value ?? '';
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Pessoa jurídica'),
                  leading: Radio<String>(
                    value: 'legal',
                    groupValue: _personType,
                    onChanged: (String? value) {
                      setState(() {
                        _personType = value ?? '';
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 80.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_personType == 'physical') {
                        Navigator.of(context)
                            .pushNamed(PessoaFisicaDadosPessoaisPage.route);
                      } else {
                        Navigator.of(context)
                            .pushNamed(PessoaJuridicaDadosPessoaisPage.route);
                      }
                    }
                  },
                  child: const Text('Avançar'),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
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
