import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models_export.dart';



class MoviesProvider extends ChangeNotifier{

  final String _apiKey = '1884c6d6be3392a0de75ce5d8ca0d17e';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  //Contenedor o Lista de pelicular.
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMoviesList   = [];


  MoviesProvider(){
    
    print('Movies Provider Inicializado');

    // MetodosGET al servicio RestFull
    //LAmados a los Metodos que hacen los request al Server.
    getOnDisplayMovies();


    //Le agregue un retraso para que se visualice la estructura
    //del ProgressCircularIndicator.
    Future.delayed(const Duration(seconds: 8)).then((value){
       getPopularMovies();
    });    
 
   
    
  }




  //Metodo getOnDisplayMovies
  //Devuelve JSON de la peticion del servicio RestFull.
  //https://api.themoviedb.org/3/movie/popular?api_key=1884c6d6be3392a0de75ce5d8ca0d17e
  //La Lista de peliculas en Cartelera de Cines.
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
    
    //Este metodo se encarga de parsear la respuesta y convertirla en Objetos.
    final nowPlayingResponse = NowPlaying.fromJson(respuesta.body);  
    print('===================================================================');
    print('Total de Resultados devueltos: ${ nowPlayingResponse.totalResults }');
    print('===================================================================');
    
    //Le asigno a mi lista de pelicular la estructura Mapeada de resultados
    //del Request
    onDisplayMovies = nowPlayingResponse.results;

    print('Estado de la Peticion: ${ respuesta.statusCode}');
    print('Cuerpo de de la Peticion: ${ respuesta.body }');
    print('getOnDisplayMovies');
    //Le decimos a todos los widget que escuchan que se actualicen.
    notifyListeners();
  }


  //Metodo getPopularMovies
  //Devuelve JSON de la peticion del servicio RestFull.
  //https://api.themoviedb.org/3/movie/popular?api_key=1884c6d6be3392a0de75ce5d8ca0d17e
  //La Lista de peliculas Populares
  getPopularMovies() async{

    var url = Uri.https(_baseUrl,'3/movie/popular',{
      'api_key'   : _apiKey,
      '_language' : _language,
      'page'      : '1'
    });

    final respuesta = await http.get(url);
    //respuesta.statusCode == '200';
    //respuesta.body
   
    //Este metodo se encarga de parsear la respuesta y convertirla en Objetos.
    final popularMoviesResponse = PopularMovies.fromJson(respuesta.body);  
    print('===================================================================');
    print('Total de Resultados devueltos: ${ popularMoviesResponse.totalResults }');
    print('===================================================================');
    
    //Le asigno a mi lista de peliculas popularMoviesList  la estructura Mapeada de resultados
    //del Request, con al diferencia que desextructuro la respuesta.
    popularMoviesList = [...popularMoviesList, ...popularMoviesResponse.results];
    print('getPopularMovies');
    //Le decimos a todos los widget que escuchan que se actualicen.
    notifyListeners();

  }


}