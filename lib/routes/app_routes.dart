
import 'package:flutter/material.dart';
import 'package:tsw_peliculas2022_app/screens/screen_exports.dart';



class AppRoutes{

  static const initialRoute = 'home';

  // Esto es un metodo de mi clase que por medio del MaterialPageRoute.
  // Devuelve una pantalla para aquellas rutas dinamicas 
  // y por A o B razon no encuentra la ruta entonces genera 
  // la alerta.
  static Route<dynamic> onGenerateRoute( RouteSettings settings){
    return MaterialPageRoute(
      builder: (context) => const PageNotFound(titulo: '', descripcion: '')
    );
  }

}