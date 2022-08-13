import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/routes/app_routes.dart';
import 'package:tsw_peliculas2022_app/screens/screen_exports.dart';


void main() => runApp(const MyApp());

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