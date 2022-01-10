import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Contador();
  }
}

class _Contador extends State<HomePage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de conteo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número de clicks',
              style: TextStyle(fontSize: 28),
            ),
            Text(
              '$contador',
              style: TextStyle(fontSize: 30),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
            
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _botones(),
    );
  }

  Widget _botones() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: cero),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: disminuir),
        SizedBox(
          width: 8,
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: aumentar)
      ],
    );
  }

  void aumentar() {
    setState(() => {contador++});
  }

  void disminuir() {
    setState(() => {contador--});
  }

  void cero() {
    setState(() => {contador = 0});
  }
}
