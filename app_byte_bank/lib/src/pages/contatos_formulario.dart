import 'package:app_byte_bank/database/dao/contatos_dao.dart';
import 'package:app_byte_bank/src/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatelessWidget {
  FormularioContato({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContatoDao _contatoDao = ContatoDao();

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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome Completo',
                hintText: 'Digite o nome completo',
              ),
            ),
            const Espaco(),
            TextField(
              controller: _accountNumberController,
              decoration: const InputDecoration(
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
                  final String name = _nameController.text;
                  final int accountNumber = int.tryParse(
                        _accountNumberController.text,
                      ) ??
                      0;
                  final Contato novoContato = Contato(
                    0,
                    name,
                    accountNumber,
                  );
                  _contatoDao.save(novoContato).then((id) => Navigator.pop(context, novoContato));
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
