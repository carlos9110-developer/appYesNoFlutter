import 'package:flutter/material.dart';

/*
Stateful Widget
Es similar al stateless en cuanto a que es un Widget, 
pero este permite mantener un estado interno y ciclo 
de vida como su inicialización y destrucción.
*/
class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  // esto lo que esta realizando es la creación del estado, lo cual lo que hace es invocar la otra clase
  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter =
      0; // con este tipo de widgets si podemos manejar estados en la aplicación
  @override
  Widget build(BuildContext context) {
    // el Scaffold da las bases de un diseño de material
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Functions')),
        // con esto podemos colocal botones al lado izquierdo de la pantalla, este recibe como parametro un widget, si quisieramos mas botones utilizariamos el widget row
        leading: IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            }),
        // con esto podemos colocal botones al lado derecho de la pantalla, este recibe como parametro una lista de widgets
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              if (clickCounter == 0) return;
              clickCounter--;
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10,
      //shape: const StadiumBorder(), // con esto volvemos el botón circular
      onPressed: onPressed,
      //onPressed:null, // con esto aplicamos el disable a los botones, no tienen acción
      child: Icon(icon), // le pasamos el icon que tenemos como propiedad de esta clase
    );
  }
}
