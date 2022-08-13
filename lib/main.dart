import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsw_peliculas2022_app/providers/movies_provider.dart';
import 'package:tsw_peliculas2022_app/routes/app_routes.dart';
import 'package:tsw_peliculas2022_app/screens/screen_exports.dart';


void main() => runApp(const AppState());



class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         
          //Lista de Proveedores que voy a tener disponibles en mi App
          //para la Inyeccion de datos que requiero en mis diferentes Widget
          //El argumento lazy en false le dice a mi provider que se ejecute
          // por defecto los providers trabajan en modo perezoso, es decir, 
          // que hasta que no sean enunciados o llaamdos por un widget no se inicializan
          //o ejecutan en el codigo, por esta razon es que con el argumente en false 
          //apenas se construye el app va a ir a obtener el listado de peliculas del Servicios RESTFUll
          ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false,)
      ]
      ,
      child: const MyApp(),
    );
  }
}






class MyApp extends StatelessWidget {

  //Constructor de mi aplicacion  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Peliculas App 2022',
      initialRoute: 'home',
      routes: {

        'home':     ((context) => const HomeScreenPage()),
        'details':  ((context) => const DetailsScreen())


      },
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData.light().copyWith(

        appBarTheme: const AppBarTheme(
          color: Colors.indigo

        )


      ),

    );
  }
}