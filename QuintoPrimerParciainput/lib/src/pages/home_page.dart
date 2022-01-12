import 'package:click_app/bloc/bloc_1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Contador();
  }
}

class _Contador extends State<HomePage> {
  int contador = 0;
  Bloc_1 obj_bloc = Bloc_1();

  TextEditingController cont_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        //stream: obj_bloc.sale_Stream,
        initialData: 0,
        builder: (context, snapshot) {
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
                    //'${snapshot.data}',
                    style: TextStyle(fontSize: 30),
                  ),
                  TextField(
                    controller: cont_text,
                    decoration: const InputDecoration(
                      hintText: 'Número de clicks',
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: _botones(),
          );
        });
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

  void dispose() {
    obj_bloc.dispose();
  }

  void aumentar() {
    setState(() => {
          contador++,
          cont_text.text = contador.toString()
          //obj_bloc.ingresa_Stream.add(IncrementaContador())
        });
  }

  void disminuir() {
    setState(() => {
          contador--,
          cont_text.text = contador.toString()
          //obj_bloc.ingresa_Stream.add(ReducirContador())
        });
  }

  void cero() {
    setState(() => {
          //obj_bloc.ingresa_Stream.add(EncerarContador())
          contador = 0,
          cont_text.text = '0'
        });
  }
}
