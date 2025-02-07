import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const PlayerCard({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color(0xFF6A0DAD), // Morado intenso
            Color(0xFF00D4FF), // Azul neón
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6A0DAD).withOpacity(0.8),
            blurRadius: 20,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Color(0xFF00D4FF).withOpacity(0.8),
            blurRadius: 30,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // 📌 Fondo oscuro translúcido detrás de la tarjeta
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),

          // 📌 Imagen del jugador
          Positioned(
            top: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 240,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 📌 Fondo con rayas blancas en "PLAYER"
          Positioned(
            bottom: 80,
            child: Container(
              width: 240,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [Colors.white.withOpacity(0.5), Colors.transparent],
                    stops: [0.3, 0.7],
                    tileMode: TileMode.repeated,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Center(
                  child: Text(
                    "PLAYER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 📌 Fondo con bordes en punta y gradiente exacto
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper:
                  HexagonClipper(), // 📌 ClipPath para simular el "clip-path: polygon()"
              child: Container(
                width: 240,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x1A00D4FF), // Azul claro transparente
                      Color(0x8A2BE2B0), // Morado neón
                      Color(0x1A00D4FF), // Azul claro transparente
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    name.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 📌 ClipPath para dar forma de hexágono al fondo del nombre
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.05, 0);
    path.lineTo(size.width * 0.95, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.95, size.height);
    path.lineTo(size.width * 0.05, size.height);
    path.lineTo(0, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
