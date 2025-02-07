import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/player_info.dart';
import 'package:flutter_application_3/widget/video_info.dart';
import 'package:flutter_application_3/widget/related_videos.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1D2B),
      appBar: AppBar(
        title: Text(
          'Video en Vivo',
          style: TextStyle(
            color: Colors.white, // Cambia el color del texto
            fontSize: 18, // Ajusta el tamaño del texto
            fontWeight: FontWeight.bold, // Opcional: negrita
          ),
        ),
        backgroundColor: Color(0xFF6C5ECF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              VideoInfo(),
              SizedBox(height: 20),
              Text(
                "Descripción del video en vivo con controles avanzados...",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 40),
              RelatedVideos(),
              SizedBox(height: 40),
              PlayerInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
