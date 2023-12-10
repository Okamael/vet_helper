import 'package:crud_persistence_alura/components/task.dart';
import 'package:crud_persistence_alura/data/task_dao.dart';
import 'package:crud_persistence_alura/screens/form_screen.dart';
import 'package:flutter/material.dart';

import '../data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? itens = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ));
                case ConnectionState.waiting:
                  return const Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ));
                case ConnectionState.active:
                  return const Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ));
                case ConnectionState.done:
                  if (snapshot.hasData && itens != null) {
                    if (itens.isNotEmpty) {
                      return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (context, index) {
                          final Task task = itens[index];
                          return task;
                        },
                      );
                    }

                    return const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Nao há Tarefa',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return const Text('Error ao caregar Tarefas');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
