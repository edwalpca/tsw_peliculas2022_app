import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/widgets/widgets_export.dart';

class DetailsScreen extends StatelessWidget {


  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    //TODO: Cambiar luego por na instancia de Movie,

    //Mecanismo para leer Argumentos que los envia la pantalla Anterior
    //En la nueva version con NullSafety el argumento en settings puede venir vacio
    //por loq ue es importante adicionar el ? despues del context.
    //validarlo con ?? para asignarle un valor por defecto en caso de no venir nada en los argumentos.
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      
      body:CustomScrollView(
        slivers: [
              //Custom App Bar que es de tipo Sliver.
              const _CustomAppBar(),
              //Toda la conleccion de Widgets en este bloque deben ser derivados
              //de los slivers, NO todos los widgets pueden colocarse en este bloque
              //por decirlo asi deben ser Familia
 
              SliverList(
                
                delegate: SliverChildListDelegate(
                  [
                    const _PosterAndTitle(),
                    const _OverView(),
                    const _OverView(),
                    const _OverView(),
                    const _OverView(),
                    const CastingCards()
                    
                  ]
                )
                ),



        ],
      )
    );
  }
}


//Custom App Bar
//
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(

      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          //margin: const EdgeInsets.all(2.0),
          width: double.infinity,
          color: Colors.amber.withOpacity(0.1),
          child: const Text('movie.title'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage('https://via.placeholder.com/200x300'),
          fit: BoxFit.cover,
          
          ),
          
      ),  
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  const _PosterAndTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20,),

          Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,),

              Text('movie.subtitle', style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 1),


              Row(
                
                children: [
                   const Icon(
                    
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,),

                   const Icon(
                    
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,),

                   const Icon(
                    
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,),


                    Text('movie.voteAverage', 
                    style: textTheme.caption ),

                ],
              )

            ],
          )


      ]),

      
    );
  }
}


class _OverView extends StatelessWidget {

  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Eu proident enim tempor ipsum cupidatat ad velit elit eiusmod occaecat amet dolor deserunt. Nostrud velit cupidatat fugiat incididunt enim sit laborum cillum velit elit sunt est minim qui. Culpa minim ea exercitation elit cillum laboris dolor id ex laborum ad. Amet voluptate officia incididunt eiusmod excepteur aliqua ea non aliqua velit quis pariatur.',
      textAlign: TextAlign.justify,
      style: textTheme.subtitle1),
    );
  }
}


