


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class MoviesProvider extends ChangeNotifier{


  String _apiKey = '1884c6d6be3392a0de75ce5d8ca0d17e';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';


  MoviesProvider(){
    
    print('Movies Provider Inicializado');

    this.getOnDisplayMovies();
    
  }

  getOnDisplayMovies() async{

    var url = Uri.https(_baseUrl,'3/movie/now_playing',{
      'api_key'   : _apiKey,
      '_language' : _language,
      'page'      : '1'
    });

    final respuesta = await http.get(url);
    //respuesta.statusCode == '200';
    //respuesta.body

    //Parseo la respuesta de mi peticion http como viene en un formato JSON
    // con la funcion json.decode(respuesta.body) la puede parsear para manipularla como guste
    final Map<String,dynamic> decodeData = json.decode(respuesta.body);
    
    // Si quiero manipular una posicion de Mapa simplemente puedo llamarlo como se ilustra
    print(decodeData['dates']);

    

    print('Estado de la Peticion: ${ respuesta.statusCode}');
    print('Cuerpo de de la Peticion: ${ respuesta.body }');

    print('getOnDisplayMovies');

  }


}