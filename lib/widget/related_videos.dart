import 'package:flutter/material.dart';

class RelatedVideos extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Prepare for your first skateboard jump',
      'views': '125.908 views',
      'image': 'https://cdn.nohat.cc/thumb/f/720/3b55eddcfffa4e87897d.jpg'
    },
    {
      'title': 'Amazing tricks for beginners',
      'views': '98.543 views',
      'image':
          'https://iamaround.it/wp-content/uploads/2015/02/pexels-photo-4663818.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Videos Relacionados',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),

        Column(
          children: videos
              .map((video) => ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(video['image']!,
                          width: 100, height: 80, fit: BoxFit.cover),
                    ),
                    title: Text(
                      video['title']!,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      video['views']!,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ))
              .toList(),
        ),

        // 📌 Nuevo Botón "Ver todos los videos relacionados (32)"
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            print("🔹 Click en 'Ver todos los videos relacionados'");
          },
          child: Container(
            height: 40,
            width: double.infinity, // Ocupa todo el ancho disponible
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Color(0xFF6C5ECF), // Color de fondo
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF6C5ECF).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              "Ver todos los videos relacionados (32)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
