import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';



class CardSwiper extends StatelessWidget {

   
  
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      //height: 500,
      height: size.height * 0.6, // PAra que tome el 60 % del area disponible de la pantalla
      decoration: const BoxDecoration(
        color: Colors.transparent
      ),
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.75,
        itemBuilder: ( _ , int index){


          return GestureDetector(
            onTap: () => Navigator.pushNamed( _ ,'details',arguments: 'instancia-de-movie')  ,
            child: ClipRRect(

            borderRadius: BorderRadius.circular(20),
            
            child: const FadeInImage(
            //placeholder: NetworkImage('https://via.placeholder.com/300x400'), 
            placeholder: AssetImage('assets/no-image.jpg'), 
            image: NetworkImage('https://via.placeholder.com/300x400'),
            fit: BoxFit.cover,
          ),
          ),
          );
        } ,

      )


    );
  }
}