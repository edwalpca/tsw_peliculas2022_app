import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/widgets/widgets_export.dart';


class HomeScreenPage extends StatelessWidget {

  const HomeScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
       title: const Text('Peliculas 2020 -Page-'),
       elevation: 0,
       actions: [

          IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined))

       ],
       ),
       
      body: Column(
        children: const <Widget>[

            //TODO
            //CardSwiper
            CardSwiper(),



            //TODO
            //Listado horizontal de Peliculas


        ],
      ),
   );
  }
}