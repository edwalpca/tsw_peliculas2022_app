import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_peliculas2022_app/providers/movies_provider.dart';
import 'package:tsw_peliculas2022_app/widgets/widgets_export.dart';

import '../search/search_delegate.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Aplicamos la Magia de Provider.
    //Le aplicamos el listen en true al provider que basicamente le dice al Widget redibujate
    //Si la informacion ha cambiado en alguna propiedad del Provider.
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text('Películas 2022'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: Column(
          children: <Widget>[
            //CardSwiper
            if (moviesProvider.onDisplayMovies.isEmpty)
              Container(
                  width: double.infinity,
                  height: size.height * 0.6,
                  child: const Center(child: CircularProgressIndicator())),

            if (moviesProvider.onDisplayMovies.isNotEmpty)
              CardSwiper(movies: moviesProvider.onDisplayMovies),

            //Separador entre el CardSwiper y el Movie Slider
            const SizedBox(
              height: 5,
            ),

            //Listado horizontal de Peliculas
            MovieSlider(
              movies: moviesProvider.popularMoviesList,
              tituloSlider: 'Las mas Populares...',
              onNextPage: () {
                moviesProvider.getPopularMovies();
                print('Solicito otro bloque de informacion.');
              },
            )
          ],
        ),
      ),
    );
  }
}
