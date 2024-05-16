// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/cubit/pessoa_fisica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_fisica/pessoa_fisica_dados_pessoais_page.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/cubit/pessoa_juridica_cubit.dart';
import 'package:project/app/cadeira/screens/pessoa_juridica/pessoa_juridica_dados_pessoais.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/home/screens/home_page.dart';
import 'package:project/app/pontos_coleta/pontos_coleta.dart';
import 'package:project/app/shared/cubit/bottom_nav_bar_cubit.dart';
import 'package:project/asset/image_asset.dart';

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
  late BottomNavBarCubit bottomNavBarCubit;
  @override
  void initState() {
    bottomNavBarCubit = BlocProvider.of<BottomNavBarCubit>(context);
    // TODO: implement initState
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
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
                            Navigator.of(context).pushNamed(
                                PessoaJuridicaDadosPessoaisPage.route);
                          }
                        }
                      },
                      child: const Text('Avançar'),
                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late BottomNavBarCubit bottomNavBarCubit;
  @override
  void initState() {
    bottomNavBarCubit = BlocProvider.of<BottomNavBarCubit>(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                if (bottomNavBarCubit.currentIndex != 0) {
                  Navigator.pushReplacementNamed(
                    context,
                    PontosColeta.route,
                  );
                }
                bottomNavBarCubit.setCurrentIndex(0);
              },
              child: Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                width: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        height: bottomNavBarCubit.currentIndex == 0 ? 28 : 25,
                        ImageAsset.pinMap,
                        semanticsLabel: 'Acme Logo',
                        color: bottomNavBarCubit.currentIndex == 0
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Pontos',
                        style: TextStyle(
                            color: bottomNavBarCubit.currentIndex == 0
                                ? Colors.black
                                : Colors.grey,
                            fontSize:
                                bottomNavBarCubit.currentIndex == 0 ? 15 : 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (bottomNavBarCubit.currentIndex != 1) {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePage.route,
                  );
                }
                bottomNavBarCubit.setCurrentIndex(1);
              },
              child: Container(
                color: const Color.fromARGB(255, 245, 245, 245),
                width: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        height: bottomNavBarCubit.currentIndex == 1 ? 28 : 25,
                        ImageAsset.home,
                        semanticsLabel: 'Acme Logo',
                        color: bottomNavBarCubit.currentIndex == 1
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            color: bottomNavBarCubit.currentIndex == 1
                                ? Colors.black
                                : Colors.grey,
                            fontSize:
                                bottomNavBarCubit.currentIndex == 1 ? 15 : 12),
                      ),
                    )
                  ],
                ),
              ),
            )
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(
            //     height: bottomNavBarCubit.currentIndex == 1 ? 25 : 27,
            //     ImageAsset.pinMap,
            //     semanticsLabel: 'Acme Logo',
            //     color: bottomNavBarCubit.currentIndex == 1
            //         ? Colors.grey
            //         : Colors.black,
            //   ),
            //   label: 'Pontos',
            // ),
          ],
        );
        // BottomNavigationBar(
        //   selectedItemColor: Colors.black,
        //   unselectedItemColor: Colors.grey,
        //   backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        //   currentIndex: bottomNavBarCubit.currentIndex,
        //   onTap: (value) {
        //     bottomNavBarCubit.setCurrentIndex(value);
        //     switch (value) {
        //       case 0:
        //         {
        //           // Navigator.popAndPushNamed(context, PontosColeta.route);
        //           Navigator.pushReplacementNamed(
        //             context,
        //             PontosColeta.route,
        //           );
        //         }
        //       case 1:
        //         {
        //           Navigator.pushReplacementNamed(
        //             context,
        //             HomePage.route,
        //           );
        //         }
        //       default:
        //     }
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset(
        //         height: bottomNavBarCubit.currentIndex == 1 ? 25 : 27,
        //         ImageAsset.pinMap,
        //         semanticsLabel: 'Acme Logo',
        //         color: bottomNavBarCubit.currentIndex == 1
        //             ? Colors.grey
        //             : Colors.black,
        //       ),
        //       label: 'Pontos',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: SvgPicture.asset(
        //         color: bottomNavBarCubit.currentIndex == 0
        //             ? Colors.grey
        //             : Colors.black,
        //         height: bottomNavBarCubit.currentIndex == 0 ? 25 : 27,
        //         ImageAsset.home,
        //         semanticsLabel: 'Acme Logo',
        //       ),
        //       label: 'Casa',
        //     ),
        //     const BottomNavigationBarItem(
        //       icon: SizedBox(),
        //       label: '',
        //     ),
        //   ],
        // );
      },
    );
  }
}
