import 'package:flutter/material.dart';
import 'package:myapp/mispantallas/Inicio.dart';
import 'package:myapp/mispantallas/pantalla2.dart';
import 'package:myapp/mispantallas/pantalla3.dart';

void main() {
  runApp(const ParisinaApp());
}

class ParisinaApp extends StatelessWidget {
  const ParisinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telas Parisina - Examen',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/pantalla2': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
      },
    );
  }
}

// --- APPBAR ACTUALIZADA CON RETROCESO INTELIGENTE ---
PreferredSizeWidget myAppBar(BuildContext context, String title, bool isHome) {
  return AppBar(
    backgroundColor: const Color(0xFF8B0000), // Rojo Oscuro
    iconTheme: const IconThemeData(color: Colors.white),
    // Si es Inicio, muestra el Logo. Si no, Flutter pone la flecha atrás automáticamente
    leading: isHome 
      ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://raw.githubusercontent.com/DeLaRosaRojas/IAMoviles-Act-14-Examen/refs/heads/main/logo.png', 
            fit: BoxFit.contain,
          ),
        )
      : null, // Al ser null en pantallas secundarias, Flutter pone el botón de atrás
    title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
    actions: const [
      Icon(Icons.shopping_cart, color: Colors.white),
      SizedBox(width: 15),
      Icon(Icons.menu, color: Colors.white),
      SizedBox(width: 10),
    ],
  );
}