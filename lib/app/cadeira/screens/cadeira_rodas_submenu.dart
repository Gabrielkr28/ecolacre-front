import 'package:flutter/material.dart';

import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/acompanhar_solicitacoes/acompanhar_solicitacoes_pesquisa.dart';

class CadeiraRodasSubmenuPage extends StatefulWidget {
  const CadeiraRodasSubmenuPage({super.key});
  static String route = '/cadeira-rodas-submenu-page';
  @override
  _CadeiraRodasSubmenuPage createState() =>
      _CadeiraRodasSubmenuPage();
}

class _CadeiraRodasSubmenuPage
    extends State<CadeiraRodasSubmenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Cadeira de rodas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: Text(
            'Encontre aqui tudo referente ás cadeiras de rodas.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0, ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              minimumSize: const Size(double.infinity, 240), // Aumentando a altura do botão
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Tornando o botão mais quadrado
                              ),
                            ),
                            onPressed: () => Navigator.of(context).pushNamed(CadeiraPessoaFisicaJuridicaPage.route),
                            icon: const Icon(Icons.add, size: 44, color: Colors.white),
                            label: const Text(
                              'Nova solicitação ',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ), 
                          ),
                          const SizedBox(height: 1),
                        ],
                      ),
                    ),

                  const SizedBox(height: 50),

                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      minimumSize: const Size(double.infinity, 240), // Aumentando a altura do botão
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15), // Tornando o botão mais quadrado
                                      ),
                                    ),
                                    onPressed: () => Navigator.of(context).pushNamed(AcompanharSoliciatacoesPesquisaPage.route),
                                    icon: const Icon(Icons.loop, size: 44, color: Colors.white),
                                    label: const Text(
                                      'Acompanhar',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ), 
                                  ),
                                  const SizedBox(height: 1),
                                ],
                              ),
                            ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

