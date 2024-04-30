// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AcompanharSoliciatacoesStatusPage extends StatefulWidget {
  const AcompanharSoliciatacoesStatusPage({super.key});
  static String route = '/acompanhar-solicitacoes-status-page';
  @override
  _AcompanharSoliciatacoesStatusPageState createState() =>
      _AcompanharSoliciatacoesStatusPageState();
}

class _AcompanharSoliciatacoesStatusPageState
    extends State<AcompanharSoliciatacoesStatusPage> {


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
            'Encontre aqui todas suas solicitações e status de cadeira de rodas.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0),
          ),
        ),
      ),


      body: ListView(
            padding: const EdgeInsets.all(25.0),
        children: <Widget>[
           const SizedBox(height: 30.0),
          RequestCard(
            requestId: '#112345',
            requestStatus: 'Análise pendente',
            iconData: Icons.hourglass_empty,
            iconColor: Color.fromARGB(255, 148, 133, 3),
          ),
           const SizedBox(height: 20.0),

          RequestCard(
            requestId: '#464183',
            requestStatus: 'Análise aprovada',
            iconData: Icons.thumb_up,
            iconColor: Colors.green,
          ),
           const SizedBox(height: 20.0),

          RequestCard(
            requestId: '#879545',
            requestStatus: 'Análise rejeitada',
            iconData: Icons.thumb_down,
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String requestId;
  final String requestStatus;
  final IconData iconData;
  final Color iconColor;

  RequestCard({
    required this.requestId,
    required this.requestStatus,
    required this.iconData,
    required this.iconColor,
  });

@override
Widget build(BuildContext context) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(8), 
            ),
            child: Icon(iconData, color: Colors.white, size: 38),
          ),
          title: Text(requestId),
          subtitle: Text(requestStatus),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Defina a quantidade de margem horizontal desejada
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Implemente a ação do botão
              },
              child: Text(
                'Visualizar',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}



}