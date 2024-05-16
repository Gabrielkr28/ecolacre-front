import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/app/cadeira/screens/cadeira_pessoa_fisica_juridica.dart';
import 'package:project/app/home/screens/home_page.dart';
import 'package:project/asset/image_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class LatLng {
  final double latitude;
  final double longitude;

  LatLng({required this.latitude, required this.longitude});
}

class PontosColetaModel {
  final String nome;
  final String street;
  final String horarioFuncionamento;
  final String telefone;
  final LatLng latLng;

  PontosColetaModel(this.nome, this.street, this.horarioFuncionamento,
      this.telefone, this.latLng);
}

var pontosColetasList = [
  PontosColetaModel(
    'Angeloni Proeb',
    'Rua 7 de setembro, 1500',
    'De 07h até 20h, segunda à sexta',
    '47-99192-3281',
    LatLng(latitude: -26.912908373896954, longitude: -49.08083026268514),
  ),
  PontosColetaModel(
    'Furb - Bloco A ',
    'Rua Antônio da veiga, 22',
    'De 09h até 20h, segunda à sexta',
    '47-99182-3380',
    LatLng(latitude: -26.905563764564796, longitude: -49.07902210500368),
  )
];

const OutlineInputBorder border =
    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)));

class PontosColeta extends StatefulWidget {
  static String route = '/pontos-coleta-page';
  const PontosColeta({super.key});

  @override
  State<PontosColeta> createState() => _PontosColetaState();
}

class _PontosColetaState extends State<PontosColeta> {
  List<PontosColetaModel> pontosColetaFiltered = pontosColetasList;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 245, 245, 245),
          height: 100,
          child: const BottomNavBar(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.popAndPushNamed(
              context,
              HomePage.route,
            ),
          ),

          title: const Text(
            'Pontos de coleta',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white, // Customize the app bar color
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
              child: TextField(
                onChanged: (value) {
                  if (value == '') {
                    setState(() {
                      pontosColetaFiltered = pontosColetasList;
                    });
                  }
                  setState(() {
                    pontosColetaFiltered = pontosColetasList
                        .where((element) => element.nome
                            .toLowerCase()
                            .contains(value.toLowerCase().trim()))
                        .toList();
                  });
                },
                cursorColor: Colors.black,
                cursorWidth: 1,
                decoration: const InputDecoration(
                  hintText: 'Procure aqui',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 186, 186, 186)),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: border,
                  border: border,
                  focusedBorder: border,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Resultados',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: pontosColetaFiltered.isNotEmpty,
                      replacement: const Expanded(
                        child: Center(
                          child: Text(
                              'Não foi possível encontrar pontos de coleta'),
                        ),
                      ),
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => PontoColetaWidget(
                            pontoColetaModel: pontosColetaFiltered[index],
                          ),
                          itemCount: pontosColetaFiltered.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PontoColetaWidget extends StatelessWidget {
  const PontoColetaWidget({
    super.key,
    required this.pontoColetaModel,
  });
  final PontosColetaModel pontoColetaModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const Text(
                    'Opções',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      launchUrl(
                        mode: LaunchMode.externalApplication,
                        Uri.parse(
                            'https://www.google.com/maps/search/?api=1&query=${pontoColetaModel.latLng.latitude},${pontoColetaModel.latLng.longitude}'),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(Icons.map),
                              ),
                              Text('Ver como chegar no mapa'),
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  height: 50,
                  ImageAsset.pinMap,
                  semanticsLabel: 'Acme Logo',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    pontoColetaModel.nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    pontoColetaModel.street,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    pontoColetaModel.horarioFuncionamento,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 124, 124, 124)),
                  ),
                  Text(
                    pontoColetaModel.telefone,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 124, 124, 124)),
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
