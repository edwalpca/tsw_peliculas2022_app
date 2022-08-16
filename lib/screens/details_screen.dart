import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/widgets/widgets_export.dart';

import '../models/models_export.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Mecanismo para leer Argumentos que los envia la pantalla Anterior
    //En la nueva version con NullSafety el argumento en settings puede venir vacio
    //por loq ue es importante adicionar el ? despues del context.
    //validarlo con ?? para asignarle un valor por defecto en caso de no venir nada en los argumentos.
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        //Custom App Bar que es de tipo Sliver.
        _CustomAppBar(movie: movie),
        //Toda la conleccion de Widgets en este bloque deben ser derivados
        //de los slivers, NO todos los widgets pueden colocarse en este bloque
        //por decirlo asi deben ser Familia

        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _OverView(
            movie: movie,
          ),
          CastingCards(movieid: movie.id)
        ])),
      ],
    ));
  }
}

//Custom App Bar
//
class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0.0),
        title: Container(
          //padding: const EdgeInsets.symmetric(vertical: 8),
          //margin: const EdgeInsets.all(2.0),
          width: double.infinity,
          color: Colors.amber.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(movie.title,
                style: const TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            key: const Key('FadeInImagefullPosterImg'),
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(movie.fullPosterImg),
            height: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const Icon(
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const Icon(
                    Icons.star_border_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  Text(movie.voteAverage.toString(), style: textTheme.caption),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;

  const _OverView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
          textAlign: TextAlign.justify, style: textTheme.subtitle1),
    );
  }
}
