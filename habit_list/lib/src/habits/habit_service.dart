import 'package:flutter/material.dart';
import 'package:habit_list/src/habits/habit_model.dart';

class HabitService with ChangeNotifier {
  final List<HabitModel> _habits = [];

  List<HabitModel> getAllHabits() {
    return [..._habits];
  }

  addHabit(HabitModel habit) {
    _habits.add(habit);
    notifyListeners();
  }

  editHabit({required int index, required HabitModel habit}) {
    _habits[index] = habit;
    notifyListeners();
  }

  removeHabit({required int index}) {
    _habits.remove(index);
    notifyListeners();
  }

  countHabits() {
    return _habits.length;
  }
}
