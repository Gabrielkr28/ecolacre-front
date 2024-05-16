import 'package:flutter/material.dart';
import 'package:project/app/core/util/application_binding.dart';
import 'package:project/app/core/util/injection_container.dart';
import 'package:project/app/home/screens/home_page.dart';
import 'package:project/routes.dart';

Future<void> main() async {
  await init();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        routes: routes,
        debugShowCheckedModeBanner: false,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        initialRoute: HomePage.route,
      ),
    );
  }
}
