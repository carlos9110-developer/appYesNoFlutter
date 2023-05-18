import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';
//import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

void main() {
  // toda aplicación en flutter tiene en su main una ejecución de un widget inicial, la cual se ejecuta con el metodo runApp
  runApp(const MyApp());
}
 

// los StatelessWidget son widgets sin estado
class MyApp extends StatelessWidget {
  // con esto le creamos una llave o un identificador a este widget, para que sea identificado en el BuildContext
  const MyApp({super.key});
   // el BuildContext entre otras cosas lo que hace es crear el arbol de widgets
  @override
  Widget build(BuildContext context) {
    // con el const mejoramos el perfomance de nuestra aplicación, lo utilizamos, es importante utilizarlo cuando sabemos que los que vamos a retornar no va cambiar
    return  MaterialApp(
      debugShowCheckedModeBanner: false, // con esto quitamos la etiqueta de debug que aparece al compilar la aplicación
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
      ), // no es constante, por que el tema varia dependiendo del dispositivo
      home: const CounterFunctionsScreen(),
    );
  }
}
