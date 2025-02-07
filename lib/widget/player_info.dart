import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_application_3/widget/PlayerCard.dart';

class PlayerInfo extends StatelessWidget {
  final List<Map<String, String>> players = [
    {
      "name": "Alice",
      "image":
          "https://images.pexels.com/photos/2889942/pexels-photo-2889942.jpeg"
    },
    {
      "name": "Bob",
      "image": "https://images.unsplash.com/photo-1587918842454-870dbd18261a"
    },
    {
      "name": "Charlie",
      "image":
          "https://images.pexels.com/photos/3370021/pexels-photo-3370021.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jugadores Destacados",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 450, // 📌 Ajustamos el tamaño
          child: Swiper(
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              return PlayerCard(
                name: players[index]['name']!,
                imageUrl: players[index]['image']!,
              );
            },
            loop: true,
            autoplay: true,
            autoplayDelay: 4000,
            itemWidth: 250,
            itemHeight: 400,
            layout:
                SwiperLayout.STACK, // 📌 Hace efecto similar al diseño en HTML
          ),
        ),
      ],
    );
  }
}
