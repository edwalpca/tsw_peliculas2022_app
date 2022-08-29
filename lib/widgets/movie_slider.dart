import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/models/models_export.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? tituloSlider;
  final Function onNextPage;

  const MovieSlider(
      {Key? key,
      required this.movies,
      this.tituloSlider,
      required this.onNextPage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      scrollController.position.pixels;

      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        //Realizo un llamado a la funcion que se va a encargar de solicitar los proximos registros
        // que contiene la paginacion.
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Realizo la valdicacion si el contenedor de peliculas tiene
    //datos, porque el widget se dibuja mas rapido que la peticion HTTP.
    if (widget.movies.isEmpty) {
      return Center(
        child: Container(
          child: Column(
            children: const [
              Text('Cargando informacion....'),
              SizedBox(height: 10),
              CircularProgressIndicator()
            ],
          ),
        ),
      );
    }

    //Si el contenido de mi Lista tiene peliculas entonces dibujo
    //mediante el ListView.builder los elementos devueltos por el Request
    return Container(
      width: double.infinity,
      height: (size.height - (size.height * 0.60)) * 0.65,
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: ,
        children: [
          if (widget.tituloSlider != null)
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(widget.tituloSlider ?? '',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          // const SizedBox(
          //   height: 8,
          // ),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) {
                    final Movie movie = widget.movies[index];

                    return _MoviePoster(
                      movie: movie,
                      heroId: '${widget.tituloSlider}-$index -${movie.id}',
                    );
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
  final Movie movie;
  final String heroId;

  const _MoviePoster({
    Key? key,
    required this.movie,
    required this.heroId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 95,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg)),
              ),
            ),
          ),

          const SizedBox(height: 8),

          //Titulo de la pelicula
          Text(movie.title,
              style: const TextStyle(fontSize: 11, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
