import 'package:flutter/material.dart';
import 'package:teste/app/config/app_routes.dart';
import 'package:teste/app/src/home/pages/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute:AppRoutes.HOMEPAGE ,
      routes:  {
        AppRoutes.HOMEPAGE : (context) =>const HomePage(),
      },
    );

  }
}