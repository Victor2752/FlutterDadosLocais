import 'package:app_byte_bank/database/dao/contatos_dao.dart';
import 'package:app_byte_bank/src/models/contato.dart';
import 'package:app_byte_bank/src/pages/contatos_formulario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({super.key});

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final List<Contato> contatos = [];
  final ContatoDao _contatoDao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    contatos.add(Contato(0, 'alex', 1000));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: FutureBuilder<List<Contato>>(
          initialData: const [],
          future: _contatoDao.findAll(),
          builder: ((context, snapshot) {
            List<Contato> contatos = snapshot.data as List<Contato>;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return const LinearProgressIndicator();
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Contato contato = contatos[index];
                    return _ContatoItem(
                      contato: contato,
                      key: UniqueKey(),
                    );
                  },
                  itemCount: contatos.length,
                );
            }
            return const Text('Erro desconhecido');
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioContato(),
                ),
              )
              .then(
                (contato) => setState(() {}),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  const _ContatoItem({Key? key, required this.contato}) : super(key: key);

  final Contato contato;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          debugPrint('clicou');
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => ListaContatos(
          //       key: key,
          //     ),
          //   ),
          // );
        },
        child: ListTile(
          title: Text(
            contato.name,
            style: const TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(
            contato.accountNumber.toString(),
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
