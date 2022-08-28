import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_peliculas2022_app/providers/movies_provider.dart';

import '../models/models_export.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            //Limpia el query, es decir el valor asignado o escrito
            //por el usuario.
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //Cerramos la pantalla y regresamos a la ventana anterior.
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(Icons.search_off_outlined, size: 80),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //return Text('buildSuggestions ${query}');
    if (query.isEmpty) {
      _emptyContainer();
    }

    //Apagamos la bandera del listen en false par aque el Widget
    // no se esta redibujando de manera innecesaria.
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      //initialData: InitialData,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data!;

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (_, int index) {
                return _MovieItem(movie: movies[index]);
              });
        } else {
          return _emptyContainer();
        }
      },
    );
  }

  @override
  String? get searchFieldLabel => 'Buscar Pelicular';

  @override
  void showResults(BuildContext context) {}

  @override
  void showSuggestions(BuildContext context) {}
}

//Widget que muestra cada resultado de Pelicul.
class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          width: 50,
          fit: BoxFit.contain,
          image: NetworkImage(movie.fullPosterImg),
          placeholder: const AssetImage('assets/no-image.jpg'),
        ),
      ),
      title: Text(
        movie.title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
