// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project/app/cadeira/screens/acompanhar_solicitacoes/acompanhar_solicitacoes_status.dart';
import '../../../home/widgets/custom_input.dart';

class AcompanharSoliciatacoesPesquisaPage extends StatefulWidget {
  const AcompanharSoliciatacoesPesquisaPage({super.key});
  static String route = '/acompanhar-solicitacoes-pesquisa-page';
  @override
  _AcompanharSoliciatacoesPesquisaPageState createState() =>
      _AcompanharSoliciatacoesPesquisaPageState();
}

class _AcompanharSoliciatacoesPesquisaPageState
    extends State<AcompanharSoliciatacoesPesquisaPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _protocoloController;

  @override
  void initState() {
    super.initState();
    _protocoloController = TextEditingController();
  }

  @override
  void dispose() {
    _protocoloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acompanhar solicitações',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.white, // Customize the app bar color
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Text(
            'Encontre aqui todas suas solicitações de cadeiras de rodas.',
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
                  labelText: 'Protocolo',
                  controller: _protocoloController,
                ),
                const SizedBox(height: 40.0),
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
                          .pushNamed(AcompanharSoliciatacoesStatusPage.route);
                    }
                  },
                  child: const Text('Avançar'),
                ),
                // TextButton(
                //   style: ButtonStyle(
                //     foregroundColor: MaterialStateProperty.all<Color>(
                //         Colors.teal), // Cor do texto do botão
                //   ),
                //   onPressed: () {
                //     // Ação para limpar o formulário
                //   },
                //   child: const Text('Limpar formulário'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
