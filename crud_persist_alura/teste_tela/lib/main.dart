import 'package:flutter/material.dart';
import 'package:teste_tela/auth/auth.dart';
import 'package:teste_tela/home/homepage.dart';
import 'package:teste_tela/pages.dart';
import 'package:teste_tela/profile/profile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: PagesRoute.home,
        theme: ThemeData(useMaterial3: true),
        routes: {
          PagesRoute.login: (context) => const Auth(),
          PagesRoute.profile: (context) => const Profile(),
        },
        home: const Homepage());
  }
}
