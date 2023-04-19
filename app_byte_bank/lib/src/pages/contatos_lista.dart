import 'package:app_byte_bank/src/pages/contatos_formulario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            Card(
              child: ListTile(
                title: Text(
                  'João',
                  style: TextStyle(fontSize: 24.0),
                ),
                subtitle: Text(
                  '1000',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioContato(
                key: UniqueKey(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
