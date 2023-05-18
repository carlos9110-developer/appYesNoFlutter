import 'package:flutter/material.dart';

/*
Stateful Widget
Es similar al stateless en cuanto a que es un Widget, 
pero este permite mantener un estado interno y ciclo 
de vida como su inicialización y destrucción.
*/
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  // esto lo que esta realizando es la creación del estado, lo cual lo que hace es invocar la otra clase
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0; // con este tipo de widgets si podemos manejar estados en la aplicación
  @override
  Widget build(BuildContext context) {
    // el Scaffold da las bases de un dideño de material
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
            Text('Click${clickCounter != 1 ? '':'s'}', style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          clickCounter++; // con esto no vemos reflejados los cambios en pantalla
          setState(() {}); // para ver reflejados los cambios en pantalla debemos de llamar esta función, lo que hace es renderizar nuevamente el widget, pero el optimiza el renderizado, cambiando solo lo que es necesario
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
