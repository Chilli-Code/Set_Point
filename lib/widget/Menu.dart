import 'package:flutter/material.dart';
import 'package:flutter_application_3/pantalla/home_screen.dart';
import 'package:flutter_application_3/pantalla/settings_screen.dart';// Importa la pantalla de ajustes
import 'package:flutter_application_3/pantalla/video_page.dart';// Importa la pantalla de ajustes

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1; // Inicialmente en el botón central (Chat)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 🚀 Si selecciona Settings, navega a la pantalla de ajustes
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => settings_screen()),
      );
    }

        if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VideoPage()),
      );
    }
        if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetPointsHomePage()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 🔹 Barra de navegación con bordes curvados
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          child: BottomAppBar(
            color: Color(0xFF1F1D2B), // Fondo oscuro
            shape: CircularNotchedRectangle(),
            notchMargin: 8.0,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(Icons.home, 0), // Home
                  _buildNavItem(Icons.settings, 2), // Ajustes
                ],
              ),
            ),
          ),
        ),

        // 🔹 Botón flotante central con efecto verde
        _buildFloatingButton(1, Icons.video_camera_back),
      ],
    );
  }

  // 📌 Botón flotante que se usa en el centro y en las opciones
  Widget _buildFloatingButton(int index, IconData icon) {
    bool isSelected = _selectedIndex == index;

    return Positioned(
      bottom: isSelected ? 35 : 20, // Sube cuando está activo
      left: index == 1
          ? MediaQuery.of(context).size.width / 2 - 30
          : (index == 0 ? 50 : MediaQuery.of(context).size.width - 100),
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF6C5ECF) : Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Color(0xFF6C5ECF).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }

  // 📌 Construcción de los botones de Home y Ajustes con efecto verde
  Widget _buildNavItem(IconData icon, int index) {
    return _buildFloatingButton(index, icon);
  }
}
