import 'package:flutter/material.dart';



class CardSwiper extends StatelessWidget {

   
  
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      //height: 500,
      height: size.height * 0.6, // PAra que tome el 60 % del area disponible de la pantalla
      decoration: const BoxDecoration(
        color: Colors.red
      ),


    );
  }
}