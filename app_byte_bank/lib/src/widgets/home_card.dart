import 'package:flutter/material.dart';

class Contatos extends StatefulWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: Column(
        children: const <Widget> [
          Text('Contatos'),
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Nome'),
              subtitle: Text('0000'),
            ),
          )
        ],
      ),
    );
  }
}