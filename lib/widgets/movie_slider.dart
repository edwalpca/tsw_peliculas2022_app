import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/models/models_export.dart';




class MovieSlider extends StatelessWidget {


   final List<Movie> movies;
   final String? tituloSlider;


  const MovieSlider({
     Key? key, 
     required this.movies, 
     this.tituloSlider
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    //Realizo la valdicacion si el contenedor de peliculas tiene
    //datos, porque el widget se dibuja mas rapido que la peticion HTTP.
    if (movies.isEmpty){
       
      
      return Center(
        child: Container(
        child: Column(
          children: const [
            Text('Cargando Lista de populares..'),
            SizedBox(height: 10),
            CircularProgressIndicator()
          ],
        ),
      ),
      );
    }    


    //Si el contenido de mi Lista tiene peliculas entonces dibujo 
    //mediante el ListView.builder los elementos devueltos por el Request
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: ,
        children:  [


      if (tituloSlider != null)  
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:5),
            child: Text(tituloSlider??'', 
            style: const TextStyle(
              fontSize: 15, 
              fontWeight: FontWeight.bold,
              color: Colors.white))
        ),

      const SizedBox(height: 8,),

      Expanded(
        child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: ( _ , int index){
              
              final Movie movie = movies[index];

              return  _MoviePoster(movie: movie,);

            })),


        ],
      ),
      
    );
  }
}


// Widget que mostrara la informacion de cada pelicula
// dentro del lListView.builder
// 
class _MoviePoster extends StatelessWidget {

  final Movie movie;


  const _MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 120,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(

        children:  [

          GestureDetector(
            onTap: () => Navigator.pushNamed( context, 'details',arguments: 'movieObjet'),
            child: 
          ClipRRect(
            
             borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight:Radius.circular(8) ),
            child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(movie.fullPosterImg)),
          ),
          ),

          const SizedBox(height: 8),

          //Titulo de la pelicula
          Text(movie.title,
          
          style: const TextStyle(fontSize: 11, color: Colors.white),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center
          )
        ],
      ),
    );
  }
}