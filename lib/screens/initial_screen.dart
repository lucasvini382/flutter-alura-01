import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Tasks(
                  'Estudar Flutter',
                  'assets/images/dash.png',
                  3),
            ),
            Tasks(
                'Andar de Bike',
                'assets/images/bike.webp',
                2),
            Tasks(
                'Ler',
                'assets/images/livro.jpg',
                4),
            Tasks(
                'Meditar',
                'assets/images/meditar.jpeg',
                5),
            Tasks('Jogar',
                'assets/images/jogar.jpg', 1),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
