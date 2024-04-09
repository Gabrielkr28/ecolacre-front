import 'package:flutter/material.dart';
import '../app/screens/widgets/custom_input.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import '../app/screens/widgets/radio_button.dart';


void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // Add this line
      locale: DevicePreview.locale(context), // Add this line
      builder: DevicePreview.appBuilder, // Add this line
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _larguraAssentoDesejadaController;
  late TextEditingController _larguraPortaController;
  late TextEditingController _cadeiraBanhoController;


  @override
  void initState() {
    super.initState();
    _larguraAssentoDesejadaController = TextEditingController();
    _larguraPortaController = TextEditingController();
    _cadeiraBanhoController = TextEditingController();
  }

  @override
  void dispose() {
    _larguraAssentoDesejadaController.dispose();
    _larguraPortaController.dispose();
    _cadeiraBanhoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),        ),
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
                  labelText: 'Qual Largura de assento você deseja? (cm)',
                  controller: _larguraAssentoDesejadaController,
                ),
                const SizedBox(height: 40.0),
                CustomInput(
                  labelText: 'Qual menor largura de porta da sua casa? (cm)',
                  controller: _larguraPortaController,
                  inputType: TextInputType.datetime,
                ),
                const SizedBox(height: 40.0),
                YesNoRadioButton(
                label: 'Possui cadeira de banho?', 
                onSelection: (bool? value) {
                },),
                const SizedBox(height: 80.0),
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal), // Cor de fundo do botão
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cor do texto do botão
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Ação do botão
                  }
                },
                child: const Text('Avançar'),
              ),

              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.teal), // Cor do texto do botão
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
