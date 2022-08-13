import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageNotFound extends StatelessWidget {

  final String titulo;
  final String descripcion;


  const PageNotFound({
    Key? key, 
    required this.titulo, 
    required this.descripcion
  }) : super(key: key);

  //Metodo para Mostrar la Alert de Dialogo en iOS.
    void displayDialogIOS(BuildContext context){

    

    //Codigo que se visualiza bien en iOS.
    showCupertinoDialog(
      // Para Bloquear el Modal
      //por defecto viene que si se pueda cerrar
      barrierDismissible: false,
      context: context,
      builder: (context){
        return CupertinoAlertDialog(
          //Redondea el Alert en los borders fr ls ventana emergente.
          title: const Text('Titulo Alert'),
          // ignore: unnecessary_const
          content: Column(
            //Determina el espacio a utilizar de acuerdo al contenido del
            //Widget por defecto esta en MainAxisSize.max ( utiliz todo el espacio posible)
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
                Text('Contenido de la Alerta Emergente'),
                SizedBox(height: 15,),
                FlutterLogo(size: 100)
            ],
          ),
          // acciones sobre mi alerta
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancelar', style: TextStyle(color: Colors.red),)),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Ok'))            
          ],


        );

      });

  }





  // Metodo para mostrar la alerta de Dialog en Android
  void displayDialogAndroid(BuildContext context){

    //Codigo que se visualiza bien en Android.
    showDialog(
      // Para Bloquear el Modal
      //por defecto viene que si se pueda cerrar
      barrierDismissible: false,
      context: context,
      builder: (context){

        return AlertDialog(
          //Redondea el Alert en los borders fr ls ventana emergente.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(12.0),
          ),
          elevation: 5,
          title: const Text('Titulo Alert'),
          // ignore: unnecessary_const
          content: Column(
            //Determina el espacio a utilizar de acuerdo al contenido del
            //Widget por defecto esta en MainAxisSize.max ( utiliz todo el espacio posible)
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
                Text('Contenido de la Alerta Emergente'),
                SizedBox(height: 15,),
                FlutterLogo(size: 100)
            ],
          ),
          // acciones sobre mi alerta
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Cancelar'))
          ],


        );

      });

  }




  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;


    return  Scaffold(
      appBar: AppBar(
        title:const Text('Ruta No localizada') ,
      ),
      body: Center(
        child: Container(
          
          width:size.width * 0.9 ,
          height:size.height * 0.9 ,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amberAccent,
            
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: const [
                Text('!upps', style: TextStyle(fontSize: 46),),
                Text('Ruta no encontrada', style: TextStyle(fontSize: 18),),
              ],
            )
            

        )
     ),
     floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.close),
      onPressed: (){

        //Cerramos la ventana actual y regresamos a la anterior
        Navigator.pop(context);

     }),
   );
  }
}