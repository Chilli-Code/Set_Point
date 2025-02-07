import 'package:flutter/material.dart';

class VideoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/f4/e3/45/f4e3450740fd30afd10277e0e6c8e7c9.jpg',
              ),
              radius: 24,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Equipo 1',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text('1,980,893 vistas',
                    style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Información básica y datos del partido 🏟',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus illum tempora...',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
