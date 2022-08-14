import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:tsw_peliculas2022_app/models/movie.dart';



class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

   
  
  const CardSwiper({
    Key? key, 
    required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    // if( movies.isEmpty) {
    //   return Container(
    //     width: double.infinity,
    //     height: size.height * 0.5,
    //     child: const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }



    return Container(
      width: double.infinity,
      //height: 500,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: size.height * 0.6, // PAra que tome el 60 % del area disponible de la pantalla
      decoration: const BoxDecoration(
        color: Colors.black87
      ),
      child: Swiper(
       
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.75,
        itemBuilder: ( _ , int index){


          final movie = movies[index];
          print(movie.posterPath);


          return GestureDetector(
            onTap: () => Navigator.pushNamed( _ ,'details',arguments: 'instancia-de-movie')  ,
            child: ClipRRect(

            borderRadius: BorderRadius.circular(20),
            
            child: FadeInImage(
            //placeholder: NetworkImage('https://via.placeholder.com/300x400'), 
            placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(movie.fullPosterImg),
            // image: NetworkImage('https://via.placeholder.com/300x400'),
            fit: BoxFit.cover,
          ),
          ),
          );




        } ,

      )


    );
  }
}