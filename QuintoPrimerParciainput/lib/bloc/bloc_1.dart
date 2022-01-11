import 'dart:async';

class ContadorBase{

}

class IncrementaContador extends ContadorBase{

}

class ReducirContador extends ContadorBase{

}

class EncerarContador extends ContadorBase{

}

//CLASE BLOC
class Bloc_1{
  //>>>>>>>ATRIBUTOS>>>>>
  //DECLARAS UN OBJETO STREAM TIPO
  int _contador = 0;  
  StreamController<ContadorBase> _entrada = StreamController();
  StreamController<int> _salida = StreamController();
  
  
  //GET
  //Stream<int> get contadorStream => this._salida.stream;
  //SALIDA
  Stream<int> get salida_Stream{
    return this._salida.stream;
  }

  //ENTRADA

  StreamSink<ContadorBase> get entrada_Stream{
    return this._entrada.sink;
  }


  //>>>>>>>CONSTRUCTOR>>>>>
  Bloc_1(){
    //ESCUCHA
    //objeto evento escuchar lo que el metodo hace
    this._entrada.stream.listen(proceso);

  }
  //>>>>>>>METODOS>>>>>
  void proceso(ContadorBase evento){
    //Si el evento es de tipo incrementa
    if(evento is IncrementaContador){
      this._contador ++;
    }else if(evento is ReducirContador){
      this._contador -- ;
    }else{
      this._contador = 0;
    }
    this._salida.add(this._contador);
  }

  //cierre los stream
  void dispose(){
    this._entrada.close();
    this._salida.close();
  }
}