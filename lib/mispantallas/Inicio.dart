import 'package:flutter/material.dart';

// --- PANTALLA 1 ---
class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Parisina", true), // true = muestra logo
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Abril De La Rosa Rojas 6I", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Tela de Algodón", style: TextStyle(fontSize: 32)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Chosen Listing", style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  _borderText("Dates: 12-15 Mar"),
                  const SizedBox(width: 10),
                  _borderText("\$ 450.00 MXN"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text("Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network('https://raw.githubusercontent.com/DeLaRosaRojas/IAMoviles-Act-14-Examen/refs/heads/main/img.png', height: 150, width: double.infinity, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  const Text("Intro: Tela premium de alta resistencia."),
                  const Text("Agenda: Disponible en tienda física."),
                  const Align(alignment: Alignment.centerRight, child: Text("Read More", style: TextStyle(decoration: TextDecoration.underline))),
                  const Divider(),
                  const Text("Reviews", style: TextStyle(fontWeight: FontWeight.bold)),
                  const ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text("María G. - ★★★★★"),
                    subtitle: Text("Excelente calidad."),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFFDD0), side: const BorderSide(color: Colors.black)),
                onPressed: () => Navigator.pushNamed(context, '/pantalla2'),
                child: const Text("BOOK NOW!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _borderText(String t) => Container(padding: const EdgeInsets.all(5), decoration: BoxDecoration(border: Border.all()), child: Text(t));
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