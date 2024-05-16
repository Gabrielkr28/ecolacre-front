import 'package:flutter/material.dart';

import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/cadeira/screens/acompanhar_solicitacoes/acompanhar_solicitacoes_pesquisa.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/shared/cubit/bottom_nav_bar_cubit.dart';

class CadeiraRodasSubmenuPage extends StatefulWidget {
  const CadeiraRodasSubmenuPage({super.key});
  static String route = '/cadeira-rodas-submenu-page';
  @override
  _CadeiraRodasSubmenuPage createState() => _CadeiraRodasSubmenuPage();
}

class _CadeiraRodasSubmenuPage extends State<CadeiraRodasSubmenuPage> {
  late BottomNavBarCubit bottomNavBarCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavBarCubit = BlocProvider.of<BottomNavBarCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        height: 100,
        child: const BottomNavBar(),
      ),
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
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size(double.infinity,
                                240), // Aumentando a altura do botão
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Tornando o botão mais quadrado
                            ),
                          ),
                          onPressed: () => Navigator.of(context)
                              .pushNamed(CadeiraPessoaFisicaJuridicaPage.route),
                          icon: const Icon(Icons.add,
                              size: 44, color: Colors.white),
                          label: const Text(
                            'Nova solicitação ',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 1),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            minimumSize: const Size(double.infinity,
                                240), // Aumentando a altura do botão
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Tornando o botão mais quadrado
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pushNamed(
                              AcompanharSoliciatacoesPesquisaPage.route),
                          icon: const Icon(Icons.loop,
                              size: 44, color: Colors.white),
                          label: const Text(
                            'Acompanhar',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
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
