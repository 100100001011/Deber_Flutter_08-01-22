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
  
    //>>>>>>>CONSTRUCTOR>>>>>
  Bloc_1(){
    //ESCUCHA
    //objeto evento escuchar lo que el metodo hace
    this._entrada.stream.listen(this.__proceso);

  }
  //>>>>>>>METODOS>>>>>
  void __proceso(ContadorBase evento){
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


  //>>>>>>>GET>>>>>>>>
  //Stream<int> get contadorStream => this._salida.stream;
  //SALIDA
  Stream<int> get sale_Stream{
    return this._salida.stream;
  }
  //ENTRADA
  StreamSink<ContadorBase> get ingresa_Stream{
    return this._entrada.sink;
  }


  //cierre los stream
  void dispose(){
    this._entrada.close();
    this._salida.close();
  }
}