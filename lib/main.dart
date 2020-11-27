import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Energia Solar',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calc Energia Solar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double valuekhw = 0.88;
  final valueController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double calculaEnergiaGasta(String contaEnergia) {
    var contaEnergiaDouble = double.parse(contaEnergia);
    return contaEnergiaDouble;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Qual o valor da sua conta de energia?',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor em R\$',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  var energiaGasta =
                      calculaEnergiaGasta(valueController.text) * 0.8;
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                              'Voce gasta aproximadamente $energiaGasta KWH'),
                        );
                      });
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                  ),
                ),
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
