import 'package:flutter/material.dart';

// --- PANTALLA 3 ---
class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Payments", false), // false = muestra flecha atrás
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Payment", style: TextStyle(fontSize: 28)),
            Center(
              child: Column(
                children: [
                  const CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://raw.githubusercontent.com/DeLaRosaRojas/IAMoviles-Act-14-Examen/refs/heads/main/img2.png')),
                  const Text("Profile info", style: TextStyle(decoration: TextDecoration.underline)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Payment Info", style: TextStyle(fontSize: 18)),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: const Color(0xFFFFFDD0), border: Border.all()),
              child: Column(
                children: [
                  const TextField(decoration: InputDecoration(hintText: "Name")),
                  const TextField(decoration: InputDecoration(hintText: "**** **** **** 2410")),
                  Row(children: const [Expanded(child: TextField(decoration: InputDecoration(hintText: "Expier"))), SizedBox(width: 10), Expanded(child: TextField(decoration: InputDecoration(hintText: "CVC")))]),
                  Row(children: const [Expanded(child: TextField(decoration: InputDecoration(hintText: "USA"))), SizedBox(width: 10), Expanded(child: TextField(decoration: InputDecoration(hintText: "20148")))]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFFDD0), minimumSize: const Size(double.infinity, 50), side: const BorderSide(color: Colors.black)),
              onPressed: () {},
              child: const Text("Make Payment", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
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