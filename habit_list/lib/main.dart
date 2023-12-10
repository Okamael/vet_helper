import 'package:flutter/material.dart';
import 'package:habit_list/src/core/app_routes.dart';
import 'package:habit_list/src/habits/habit_form.dart';
import 'package:habit_list/src/habits/habit_service.dart';
import 'package:habit_list/src/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HabitService())],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (context) => const HomePage(),
          AppRoutes.HABIT_FORM: (context) => HabitForm()
        },
      ),
    );
  }
}
