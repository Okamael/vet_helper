import 'package:flutter/material.dart';
import 'package:teste/app/src/dosagem/page/medicacao_pre_anestesica/pre_anestesica.dart';

enum TipoRemedio{
  mpa, anestesia
}
class DosagemPage extends StatefulWidget {
  const DosagemPage({super.key});

  @override
  State<DosagemPage> createState() => _DosagemPageState();
}

class _DosagemPageState extends State<DosagemPage> {
  
  TipoRemedio selection = TipoRemedio.mpa;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton<TipoRemedio>(segments: [
          ButtonSegment(value: TipoRemedio.mpa, label: Text('Medicação Pré Anestésica')),
          ButtonSegment(value: TipoRemedio.anestesia, label: Text('Anestesia'))
        ], selected: {selection},
        onSelectionChanged: (Set<TipoRemedio> seleted) {
          
          setState(() {
          selection =  seleted.first;  
          });
          
        },
        ),
        if(selection == TipoRemedio.mpa)
        PreAnestesica()
      ],
    );
    
    
  }
}