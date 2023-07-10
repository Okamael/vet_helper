import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PreAnestesicos { acepran, petidina }

class PreAnestesica extends StatefulWidget {
  const PreAnestesica({super.key});

  @override
  State<PreAnestesica> createState() => _PreAnestesicaState();
}

class _PreAnestesicaState extends State<PreAnestesica> {
  var _preAnestesicosGroup = PreAnestesicos.acepran;
  final _pesoController = TextEditingController();

  _calcDosagem() {
    switch (_preAnestesicosGroup) {
      case PreAnestesicos.acepran:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Acepran'),
          leading: Radio(
            value: PreAnestesicos.acepran,
            groupValue: _preAnestesicosGroup,
            onChanged: (PreAnestesicos? value) {
              setState(() {
                _preAnestesicosGroup = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Petidina'),
          leading: Radio(
            value: PreAnestesicos.petidina,
            groupValue: _preAnestesicosGroup,
            onChanged: (PreAnestesicos? value) {
              setState(() {
                _preAnestesicosGroup = value!;
              });
            },
          ),
        ),
        const Divider(height: 2),
        const Text('Formula: (Peso x 0.05) /2 '),
        Form(
            child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _pesoController,
              decoration: const InputDecoration(
                hintText: 'Peso',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite O peso';
                }
                return null;
              },
            ),
          ],
        ))
      ],
    );
  }
}
