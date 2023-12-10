import 'package:flutter/material.dart';
import 'package:habit_list/src/habits/habit_model.dart';
import 'package:habit_list/src/habits/habit_service.dart';
import 'package:provider/provider.dart';

class HabitForm extends StatelessWidget {
  HabitForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final service = context.watch<HabitService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('HabitForm'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                controller: _textController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final habit =
                          HabitModel(description: _textController.text);
                      service.addHabit(habit);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Habito Salvado')));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          )),
    );
  }
}
