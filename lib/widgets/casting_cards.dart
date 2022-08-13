import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 210,
      // color: Colors.red,
      child: ListView.builder(
        itemCount: 10,
        //Direccion de mi Scroll
        scrollDirection: Axis.horizontal, 
        itemBuilder: (_,int index){
          return const _CardActores();
        }),

    );
  }
}

class _CardActores extends StatelessWidget {
  const _CardActores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10,),
      width: 110,
      height: 130,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              fit: BoxFit.cover,),
          ),

          const SizedBox(height: 8,),
          //Titulo de los actores.
          const Text('actor.nombre',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center)
        ],
      ),
    );
  }
}