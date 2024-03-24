import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app/screens/widgets/option_button.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
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
                text: "Pontos de Coleta",
                icon: Icons.location_on,
                onPress: () => print("Hello"),
              ),
              OptionButton(
                text: "Cadeira de Rodas",
                icon: Icons.wheelchair_pickup,
                onPress: () => print("Hello"),
              ),
              OptionButton(
                text: "Informativos",
                icon: Icons.chat,
                onPress: () => print("Hello"),
              ),
              OptionButton(
                text: "Ser um ponto" + "\n" + " de coleta",
                icon: Icons.add_location_alt_rounded,
                onPress: () => print("Hello"),
              ),
            ],
          )
        ],
      )),
    );
  }
}
