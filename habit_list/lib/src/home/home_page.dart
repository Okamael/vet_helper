import 'package:flutter/material.dart';
import 'package:habit_list/src/core/app_routes.dart';
import 'package:habit_list/src/habits/habit_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit List'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.HABIT_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: const HabitListPage(),
    );
  }
}
