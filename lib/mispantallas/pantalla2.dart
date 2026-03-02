import 'package:flutter/material.dart';

// --- PANTALLA 2: BOOKING (Fiel al Wireframe de la Imagen) ---
class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Booking", false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Booking", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400)),
            const SizedBox(height: 15),
            
            // Selector de Hotel
            _selector("Hotel", Icons.keyboard_arrow_up),
            const SizedBox(height: 15),
            
            // CONTENEDOR NEGRO PRINCIPAL (FIGHTS)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: [
                  const Text("FIGHTS v", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),

                  // SECCIÓN ARRIVAL
                  const Align(
                    alignment: Alignment.centerLeft, 
                    child: Text("  ARRIVAL", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                  ),
                  _scrollableFlightBox("Date, Time: 12/03/26"),

                  const SizedBox(height: 20),
                  const Divider(color: Colors.black, thickness: 1),
                  const SizedBox(height: 10),

                  // SECCIÓN DEPARTUR
                  const Align(
                    alignment: Alignment.centerLeft, 
                    child: Text("  DEPARTUR", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                  ),
                  _scrollableFlightBox("Date, Time: 15/03/26"),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            // Selector de Activities
            _selector("Activities", Icons.keyboard_arrow_down),
            
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFDD0),
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                onPressed: () => Navigator.pushNamed(context, '/pantalla3'),
                child: const Text("Continue to Payment", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Este widget crea el cuadro azul con la barra de scroll integrada (como en la imagen)
  Widget _scrollableFlightBox(String text) {
    return Container(
      height: 80, // Altura fija para forzar el scroll
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2F1), // Azul clarito
        border: Border.all(color: Colors.black54),
      ),
      child: Row(
        children: [
          // Área de contenido con scroll
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _flightItem(text),
                  _flightItem("Date, Time: 20/03/26"), // Segundo item para que haga scroll
                ],
              ),
            ),
          ),
          // BARRA DE SCROLL (Rectángulo gris pegado al borde derecho del cuadro azul)
          Container(
            width: 15,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: const Border(left: BorderSide(color: Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }

  // Contenido interno del cuadro (Palomita + Texto)
  Widget _flightItem(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, size: 22),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Container(width: 100, height: 1.5, color: Colors.black26),
              const SizedBox(height: 4),
              Container(width: 60, height: 1.5, color: Colors.black26),
            ],
          ),
        ],
      ),
    );
  }

  Widget _selector(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(text), Icon(icon)],
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