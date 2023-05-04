import 'package:app_byte_bank/src/models/contato.dart';
import 'package:app_byte_bank/src/pages/contatos_lista.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Contato> contatos = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    contatos.add(Contato(0, 'alex', 1000));
    contatos.add(Contato(1, 'joão', 2000));
    contatos.add(Contato(2, 'maria', 3000));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListaContatos(key: UniqueKey()),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
          debugPrint('Selected $index');
        },
        selectedIndex: selectedIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.people),
            icon: Icon(Icons.people_outline),
            label: 'Contatos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.monetization_on),
            icon: Icon(Icons.monetization_on_outlined),
            label: 'Transações',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }
}
