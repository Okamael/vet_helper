import 'package:flutter/material.dart';
import 'package:teste_tela/pages.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, PagesRoute.home);
              },
            ),
            ListTile(
              title: const Text('Auth'),
              onTap: () {
                Navigator.pushNamed(context, PagesRoute.login);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, PagesRoute.profile);
              },
            )
          ],
        ),
      ),
    );
  }
}
