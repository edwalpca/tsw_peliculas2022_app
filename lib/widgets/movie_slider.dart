import 'package:flutter/material.dart';




class MovieSlider extends StatelessWidget {





  const MovieSlider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      color: Colors.amberAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: ,
        children:  [

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
            child: Text('Peliculas Populares', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          ),


      Expanded(
        child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: ( _ , int index){
              
              return const _MoviePoster();

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
  const _MoviePoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 250,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(

        children:  [

          GestureDetector(
            onTap: () => Navigator.pushNamed( context, 'details',arguments: 'movieObjet'),
            child: 
          const ClipRRect(
            
             borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight:Radius.circular(8) ),
            child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage('https://via.placeholder.com/300x400')),
          ),
          ),

          //Titulo de la pelicula
          const Text('Titulo de la Pelicula sobre la cual ',
          style: TextStyle(fontSize: 11),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center
          )
        ],
      ),
    );
  }
}