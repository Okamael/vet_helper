import 'package:flutter/material.dart';
import 'package:habit_list/src/habits/habit_model.dart';
import 'package:habit_list/src/habits/habit_service.dart';
import 'package:provider/provider.dart';

class HabitListPage extends StatefulWidget {
  const HabitListPage({super.key});

  @override
  State<HabitListPage> createState() => _HabitListPageState();
}

class _HabitListPageState extends State<HabitListPage> {
  @override
  Widget build(BuildContext context) {
    final habitService = context.watch<HabitService>();
    final List<HabitModel> items = habitService.getAllHabits();
    return habitService.getAllHabits() == 0
        ? Center(
            child: Text('Não há itens a serem exibidos'),
          )
        : ListView.builder(
            itemCount: habitService.countHabits(),
            itemBuilder: (context, index) {
              return ClipRRect(
                child: Card(
                  child: ListTile(
                    title: Text(items[index].description),
                  ),
                ),
              );
            },
          );
  }
}
