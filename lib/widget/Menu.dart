import 'package:flutter/material.dart';
import '../pantalla/video_page.dart'; // Importamos la pantalla de videos

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menú',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context); // Cierra el menú
            },
          ),
          ListTile(
            title: Text('Categorías'),
            onTap: () {
              Navigator.pop(context); // Cierra el menú
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPage()), // Redirige a VideoPage
              );
            },
          ),
        ],
      ),
    );
  }
}
