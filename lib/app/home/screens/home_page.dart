import 'package:flutter/material.dart';
import 'package:project/app/core/util/app_strings.dart';
import 'package:project/app/home/widgets/option_button.dart';
import 'package:project/app/cadeira/screens/cadeira_rodas_submenu.dart';
import 'package:project/app/pontos_coleta/pontos_coleta.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Row(
            children: [
              Container(
                color: const Color(0xFF39978B),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 3,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton(
              text: AppStrings.collectionPoints,
              icon: Icons.location_on,
              onPress: () =>
                  Navigator.of(context).pushNamed(PontosColeta.route),
            ),
            OptionButton(
              text: AppStrings.wheelchair,
              icon: Icons.wheelchair_pickup,
              onPress: () => Navigator.of(context)
                  .pushNamed(CadeiraRodasSubmenuPage.route),
            ),
            OptionButton(
              text: AppStrings.newsletters,
              icon: Icons.chat,
              onPress: () => launchUrl(
                  Uri.parse('https://www.campanhalacresolidario.com.br/')),
            ),
            OptionButton(
              text: AppStrings.toBeaCollectionPoint,
              icon: Icons.add_location_alt_rounded,
              onPress: () => print('Ser um ponto de coleta'),
            ),
          ],
        )
      ],
    ));
  }
}
