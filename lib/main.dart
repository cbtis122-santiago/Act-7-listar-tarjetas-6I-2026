import 'package:flutter/material.dart';

void main() => runApp(const AlaburgerApp());

class AlaburgerApp extends StatelessWidget {
  const AlaburgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const AlaburgerHome(),
    );
  }
}

class AlaburgerHome extends StatelessWidget {
  const AlaburgerHome({super.key});

  // Color azul elegante definido como constante
  static const Color azulElegante = Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Fondo gris muy claro (estilo Apple)
      
      // 1. APPBAR (Tema Alaburger)
      appBar: AppBar(
        backgroundColor: azulElegante,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.lunch_dining, color: Colors.white),
        title: const Text(
          'Alaburger',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.fastfood, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.shopping_bag, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.stars, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),

      // 2. BODY CON COLUMNA DE TARJETAS
      body: ListView( // Usamos ListView para que tenga scroll automático
        padding: const EdgeInsets.all(16),
        children: const [
          // Aquí pasamos los parámetros: título, subtítulo y la URL de la imagen
          MenuCard(
            titulo: "La Clásica",
            subtitulo: "Carne angus, cheddar y pan artesanal",
            urlImagen: "https://raw.githubusercontent.com/cbtis122-santiago/iamgenes-pra-flutter-6to-i-fecha-10-de-feb-2026/refs/heads/main/photo-1568901346375-23c9450c58cd.jpg",
          ),
          MenuCard(
            titulo: "Blue Cheese Burger",
            subtitulo: "Queso azul, cebolla caramelizada y rúcula",
            urlImagen: "https://raw.githubusercontent.com/cbtis122-santiago/iamgenes-pra-flutter-6to-i-fecha-10-de-feb-2026/refs/heads/main/photo-1594212699903-ec8a3eca50f5.jpg",
          ),
          MenuCard(
            titulo: "Bacon Monster",
            subtitulo: "Triple bacon crujiente y salsa secreta",
            urlImagen: "https://raw.githubusercontent.com/cbtis122-santiago/iamgenes-pra-flutter-6to-i-fecha-10-de-feb-2026/refs/heads/main/photo-1553979459-d2229ba7433b.jpg",
          ),
          MenuCard(
            titulo: "Veggie Supreme",
            subtitulo: "Medallón de quinoa y aguacate fresco",
            urlImagen: "https://raw.githubusercontent.com/cbtis122-santiago/iamgenes-pra-flutter-6to-i-fecha-10-de-feb-2026/refs/heads/main/photo-1550547660-d9450f859349.jpg",
          ),
        ],
      ),
    );
  }
}

// 3. WIDGET DE LA TARJETA PERSONALIZADO
class MenuCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String urlImagen; // Parámetro para la URL desde la red

  const MenuCard({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.urlImagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // Sombreado difuminado elegante
        boxShadow: [
          BoxShadow(
            color: AlaburgerHome.azulElegante.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Imagen desde la red con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                urlImagen,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                // Manejo de error si la URL falla
                errorBuilder: (context, error, stackTrace) => 
                  const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
            
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AlaburgerHome.azulElegante,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            
            // Icono de Like
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}