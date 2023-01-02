import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:alura_flutter_curso_1/data/task_dao.dart';
import 'package:alura_flutter_curso_1/screens/form_screen.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Tarefas'),
        leading: Container(),
        actions: [
          IconButton(onPressed: () {setState(() {});}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
              case ConnectionState.waiting:
                Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando')
                    ],
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task task = items[index];
                          return task;
                        });
                  }
                  return Center(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text('Não há nenhuma tarefa')
                      ],
                    ),
                  );
                }
                return const Text('Erro ao carregar Tarefas');
            }
            return const Text('Erro desconhecido');
          },
        ),
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
          ).then((value) => setState(() {
                print('Recarregando a tela inicial');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
