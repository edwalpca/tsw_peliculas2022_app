import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_peliculas2022_app/providers/movies_provider.dart';

import '../models/models_export.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId),
      //initialData: InitialData,
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Column(
              children: const [
                Text('Cargando informacion....'),
                SizedBox(height: 10),
                CircularProgressIndicator()
              ],
            ),
          );
        }

        if (snapshot.data!.isEmpty) {
          return Center(
            child: Container(
                child: const Text(
                    'No hay lista de actores relacionados con la pelicula')),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 210,
          // color: Colors.red,
          child: ListView.builder(
              itemCount: cast.length,
              //Direccion de mi Scroll
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return _CardActores(
                  actor: cast[index],
                );
              }),
        );
      },
    );
  }
}

class _CardActores extends StatelessWidget {
  final Cast actor;

  const _CardActores({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 100,
      height: 130,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullprofilePath),
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            height: 8,
          ),
          //Titulo de los actores.
          Text(actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
