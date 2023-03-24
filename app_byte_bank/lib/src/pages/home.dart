import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('images/sqg_tec_logo.png', width: 320),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contacts');
                  },
                  child: Row(children: const [
                    Icon(Icons.people),
                    Text('Contacts'),
                  ])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/transactions');
                  },
                  child: Row(children: const [
                    Icon(Icons.monetization_on),
                    Text('Transactions'),
                  ])),
            ],
          ),
          Column(children: [
            const Center(
              child: Text('You have pushed the button this many times:'),
            ),
            Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ]),
          Wrap(children: const [
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                title: Text('Nome'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                title: Text('Nome'),
              ),
            ),
          ]),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
