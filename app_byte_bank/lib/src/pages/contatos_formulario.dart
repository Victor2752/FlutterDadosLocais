import 'package:flutter/material.dart';

class FormularioContato extends StatelessWidget {
  const FormularioContato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome Completo',
                hintText: 'Digite o nome completo',
              ),
            ),
            const Espaco(),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Numero da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
            const Espaco(),
            const Espaco(),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Clicou no botão');
                },
                child: const Text('Criar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Espaco extends StatelessWidget {
  const Espaco({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8.0,
    );
  }
}