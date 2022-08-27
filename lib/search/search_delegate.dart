import 'package:flutter/material.dart';

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
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions ${query}');
  }

  @override
  String? get searchFieldLabel => 'Buscar Pelicular';

  @override
  void showResults(BuildContext context) {}

  @override
  void showSuggestions(BuildContext context) {}
}
